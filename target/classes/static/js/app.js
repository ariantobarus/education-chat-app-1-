const { useState, useEffect } = React;
const { HashRouter, Routes, Route, Link, Navigate, useParams } = ReactRouterDOM;

// Komponen API untuk interaksi dengan backend
const api = axios.create({
    baseURL: '/api',
    headers: { 'Content-Type': 'application/json' }
});

api.interceptors.request.use(config => {
    const token = localStorage.getItem('token');
    if (token) {
        config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
});

// Komponen Halaman
function App() {
    const [isAuthenticated, setIsAuthenticated] = useState(!!localStorage.getItem('token'));

    const setAuth = (status) => setIsAuthenticated(status);

    return (
        <HashRouter>
            <Routes>
                <Route path="/login" element={<Login setAuth={setAuth} />} />
                <Route path="/register" element={<Register />} />
                <Route path="/*" element={
                    isAuthenticated ? <MainLayout setAuth={setAuth} /> : <Navigate to="/login" />
                } />
            </Routes>
        </HashRouter>
    );
}

function MainLayout({ setAuth }) {
    const user = {
        username: localStorage.getItem('username'),
        role: localStorage.getItem('role')
    };

    const handleLogout = () => {
        localStorage.clear();
        setAuth(false);
    };

    return (
        <div className="dashboard-container">
            <div className="sidebar">
                <h3 className="p-3 text-center">EduChat</h3>
                <nav>
                    <Link to="/dashboard" className="nav-link"><i className="fas fa-home me-2"></i>Dashboard</Link>
                    <Link to="/modules" className="nav-link"><i className="fas fa-book-open me-2"></i>Modul Belajar</Link>
                    <Link to="/quiz" className="nav-link"><i className="fas fa-pencil-alt me-2"></i>Mulai Kuis</Link>
                    <Link to="/chat" className="nav-link"><i className="fas fa-comments me-2"></i>Chat</Link>
                    {user.role === 'ADMIN' && (
                        <Link to="/admin" className="nav-link"><i className="fas fa-user-shield me-2"></i>Admin Panel</Link>
                    )}
                </nav>
                <div className="p-3 mt-auto">
                    <p className="mb-1">{user.username}</p>
                    <small className="text-muted">{user.role}</small>
                    <button onClick={handleLogout} className="btn btn-danger w-100 mt-2">Logout</button>
                </div>
            </div>
            <main className="content">
                <Routes>
                    <Route path="/dashboard" element={<Dashboard />} />
                    <Route path="/modules" element={<LearningModules />} />
                    <Route path="/quiz" element={<Quiz />} />
                    <Route path="/chat" element={<Chat />} />
                    {user.role === 'ADMIN' && <Route path="/admin" element={<AdminPanel />} />}
                    <Route path="*" element={<Navigate to="/dashboard" />} />
                </Routes>
            </main>
        </div>
    );
}

// Komponen spesifik lainnya (Login, Register, Dashboard, dll.)
function Login({ setAuth }) {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await api.post('/auth/login', { username, password });
            localStorage.setItem('token', response.data.token);
            localStorage.setItem('username', response.data.username);
            localStorage.setItem('role', response.data.role);
            setAuth(true);
        } catch (err) {
            setError('Login Gagal. Periksa kembali username dan password Anda.');
        }
    };

    return (
        <div className="auth-container">
            <h2 className="text-center mb-4">Login EduChat</h2>
            {error && <div className="alert alert-danger">{error}</div>}
            <form onSubmit={handleSubmit}>
                <div className="mb-3">
                    <label className="form-label">Username</label>
                    <input type="text" value={username} onChange={e => setUsername(e.target.value)} className="form-control" required />
                </div>
                <div className="mb-3">
                    <label className="form-label">Password</label>
                    <input type="password" value={password} onChange={e => setPassword(e.target.value)} className="form-control" required />
                </div>
                <button type="submit" className="btn btn-primary w-100">Login</button>
            </form>
            <p className="text-center mt-3">Belum punya akun? <Link to="/register">Daftar di sini</Link></p>
        </div>
    );
}

// ... Tambahkan komponen Register, Dashboard, LearningModules, Quiz, Chat, AdminPanel di sini

ReactDOM.render(<App />, document.getElementById('root'));