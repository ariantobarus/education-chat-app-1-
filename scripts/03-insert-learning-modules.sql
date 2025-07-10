-- Insert Learning Modules for TWK, TIU, and TKP

-- TWK (Tes Wawasan Kebangsaan) Modules
INSERT INTO learning_modules (title, description, type, content, order_index, active) VALUES
('Pancasila sebagai Dasar Negara', 'Memahami nilai-nilai Pancasila dan implementasinya dalam kehidupan berbangsa dan bernegara', 'TWK', 
'<h3>Pancasila sebagai Dasar Negara</h3>
<p>Pancasila adalah dasar filosofis negara Indonesia yang terdiri dari lima sila:</p>
<ol>
<li><strong>Ketuhanan Yang Maha Esa</strong> - Mengakui adanya Tuhan dan menghormati kebebasan beragama</li>
<li><strong>Kemanusiaan yang Adil dan Beradab</strong> - Menghargai harkat dan martabat manusia</li>
<li><strong>Persatuan Indonesia</strong> - Mengutamakan persatuan dan kesatuan bangsa</li>
<li><strong>Kerakyatan yang Dipimpin oleh Hikmat Kebijaksanaan dalam Permusyawaratan/Perwakilan</strong> - Demokrasi berdasarkan musyawarah mufakat</li>
<li><strong>Keadilan Sosial bagi Seluruh Rakyat Indonesia</strong> - Mewujudkan kesejahteraan dan keadilan untuk semua</li>
</ol>', 1, true),

('UUD 1945 dan Amandemennya', 'Mempelajari konstitusi Indonesia dan perubahan-perubahannya', 'TWK',
'<h3>UUD 1945 dan Amandemennya</h3>
<p>Undang-Undang Dasar 1945 adalah konstitusi negara Indonesia yang telah mengalami empat kali amandemen:</p>
<ul>
<li><strong>Amandemen I (1999)</strong> - Pembatasan kekuasaan presiden</li>
<li><strong>Amandemen II (2000)</strong> - Hak asasi manusia dan otonomi daerah</li>
<li><strong>Amandemen III (2001)</strong> - Kedaulatan rakyat dan pemilihan presiden</li>
<li><strong>Amandemen IV (2002)</strong> - Lembaga negara dan sistem pemerintahan</li>
</ul>', 2, true),

('Sejarah Perjuangan Bangsa Indonesia', 'Memahami perjalanan sejarah kemerdekaan Indonesia', 'TWK',
'<h3>Sejarah Perjuangan Bangsa Indonesia</h3>
<p>Perjuangan kemerdekaan Indonesia melalui berbagai fase:</p>
<ul>
<li><strong>Masa Penjajahan</strong> - VOC, Hindia Belanda, Jepang</li>
<li><strong>Pergerakan Nasional</strong> - Budi Utomo, Sarekat Islam, Indische Partij</li>
<li><strong>Proklamasi Kemerdekaan</strong> - 17 Agustus 1945</li>
<li><strong>Mempertahankan Kemerdekaan</strong> - Revolusi fisik 1945-1949</li>
</ul>', 3, true),

('Bhinneka Tunggal Ika', 'Memahami konsep kebhinekaan dalam persatuan Indonesia', 'TWK',
'<h3>Bhinneka Tunggal Ika</h3>
<p>Semboyan "Bhinneka Tunggal Ika" berarti berbeda-beda tetapi tetap satu, yang mencerminkan:</p>
<ul>
<li><strong>Keberagaman Suku</strong> - Lebih dari 300 suku bangsa</li>
<li><strong>Keberagaman Bahasa</strong> - Lebih dari 700 bahasa daerah</li>
<li><strong>Keberagaman Agama</strong> - 6 agama resmi yang diakui</li>
<li><strong>Keberagaman Budaya</strong> - Adat istiadat yang beragam</li>
</ul>', 4, true),

('NKRI dan Wawasan Nusantara', 'Memahami konsep Negara Kesatuan Republik Indonesia', 'TWK',
'<h3>NKRI dan Wawasan Nusantara</h3>
<p>Negara Kesatuan Republik Indonesia (NKRI) dengan Wawasan Nusantara sebagai konsep geopolitik:</p>
<ul>
<li><strong>Konsep Archipelagic State</strong> - Negara kepulauan</li>
<li><strong>Batas Wilayah</strong> - Darat, laut, dan udara</li>
<li><strong>Otonomi Daerah</strong> - Desentralisasi pemerintahan</li>
<li><strong>Ketahanan Nasional</strong> - Pertahanan dan keamanan</li>
</ul>', 5, true);

-- TIU (Tes Intelejensi Umum) Modules
INSERT INTO learning_modules (title, description, type, content, order_index, active) VALUES
('Logika Matematika Dasar', 'Memahami konsep dasar logika dan penalaran matematika', 'TIU',
'<h3>Logika Matematika Dasar</h3>
<p>Logika matematika meliputi:</p>
<ul>
<li><strong>Proposisi</strong> - Pernyataan yang bernilai benar atau salah</li>
<li><strong>Konjungsi (∧)</strong> - Operasi "dan"</li>
<li><strong>Disjungsi (∨)</strong> - Operasi "atau"</li>
<li><strong>Implikasi (→)</strong> - Operasi "jika...maka"</li>
<li><strong>Biimplikasi (↔)</strong> - Operasi "jika dan hanya jika"</li>
</ul>
<p><strong>Contoh Soal:</strong> Jika p: "Hari ini hujan" dan q: "Saya membawa payung", maka p → q berarti "Jika hari ini hujan, maka saya membawa payung"</p>', 1, true),

('Deret dan Barisan Angka', 'Mempelajari pola deret dan barisan dalam matematika', 'TIU',
'<h3>Deret dan Barisan Angka</h3>
<p>Jenis-jenis barisan dan deret:</p>
<ul>
<li><strong>Barisan Aritmatika</strong> - Selisih tetap (a, a+b, a+2b, ...)</li>
<li><strong>Barisan Geometri</strong> - Rasio tetap (a, ar, ar², ...)</li>
<li><strong>Barisan Fibonacci</strong> - Jumlah dua suku sebelumnya</li>
<li><strong>Barisan Kuadrat</strong> - 1, 4, 9, 16, 25, ...</li>
</ul>
<p><strong>Contoh:</strong> 2, 5, 8, 11, 14, ... (barisan aritmatika dengan beda 3)</p>', 2, true),

('Analisis Verbal', 'Kemampuan memahami dan menganalisis teks', 'TIU',
'<h3>Analisis Verbal</h3>
<p>Kemampuan analisis verbal meliputi:</p>
<ul>
<li><strong>Sinonim</strong> - Kata yang memiliki makna sama</li>
<li><strong>Antonim</strong> - Kata yang memiliki makna berlawanan</li>
<li><strong>Analogi</strong> - Perbandingan hubungan antar kata</li>
<li><strong>Pemahaman Bacaan</strong> - Memahami isi dan makna teks</li>
</ul>
<p><strong>Contoh Analogi:</strong> Dokter : Rumah Sakit = Guru : ?<br>Jawaban: Sekolah (hubungan profesi dengan tempat kerja)</p>', 3, true),

('Penalaran Numerik', 'Kemampuan berhitung dan penalaran dengan angka', 'TIU',
'<h3>Penalaran Numerik</h3>
<p>Materi penalaran numerik:</p>
<ul>
<li><strong>Operasi Hitung Dasar</strong> - Tambah, kurang, kali, bagi</li>
<li><strong>Persentase</strong> - Menghitung persen dan perbandingan</li>
<li><strong>Rasio dan Proporsi</strong> - Perbandingan antar besaran</li>
<li><strong>Statistik Dasar</strong> - Mean, median, modus</li>
</ul>
<p><strong>Contoh:</strong> Jika 20% dari 150 adalah x, maka x = 20/100 × 150 = 30</p>', 4, true),

('Penalaran Logis', 'Kemampuan berpikir logis dan sistematis', 'TIU',
'<h3>Penalaran Logis</h3>
<p>Jenis-jenis penalaran logis:</p>
<ul>
<li><strong>Silogisme</strong> - Penarikan kesimpulan dari premis</li>
<li><strong>Penalaran Deduktif</strong> - Dari umum ke khusus</li>
<li><strong>Penalaran Induktif</strong> - Dari khusus ke umum</li>
<li><strong>Penalaran Analogis</strong> - Berdasarkan kesamaan</li>
</ul>
<p><strong>Contoh Silogisme:</strong><br>Premis 1: Semua manusia fana<br>Premis 2: Socrates adalah manusia<br>Kesimpulan: Socrates fana</p>', 5, true);

-- TKP (Tes Karakteristik Pribadi) Modules
INSERT INTO learning_modules (title, description, type, content, order_index, active) VALUES
('Integritas dan Kejujuran', 'Memahami pentingnya integritas dalam kehidupan profesional', 'TKP',
'<h3>Integritas dan Kejujuran</h3>
<p>Integritas adalah kesesuaian antara nilai, pikiran, perkataan, dan tindakan. Meliputi:</p>
<ul>
<li><strong>Kejujuran</strong> - Berkata dan bertindak sesuai kebenaran</li>
<li><strong>Konsistensi</strong> - Teguh pada prinsip dan nilai</li>
<li><strong>Transparansi</strong> - Terbuka dan dapat dipertanggungjawabkan</li>
<li><strong>Akuntabilitas</strong> - Bertanggung jawab atas tindakan</li>
</ul>
<p><strong>Contoh Situasi:</strong> Ketika menemukan kesalahan dalam laporan, seorang pegawai yang berintegritas akan melaporkan dan memperbaikinya meskipun tidak ada yang mengetahui.</p>', 1, true),

('Semangat Berprestasi', 'Motivasi untuk mencapai hasil terbaik dalam pekerjaan', 'TKP',
'<h3>Semangat Berprestasi</h3>
<p>Semangat berprestasi adalah dorongan untuk mencapai hasil terbaik:</p>
<ul>
<li><strong>Orientasi Hasil</strong> - Fokus pada pencapaian target</li>
<li><strong>Inovasi</strong> - Mencari cara-cara baru yang lebih efektif</li>
<li><strong>Pembelajaran Berkelanjutan</strong> - Terus mengembangkan diri</li>
<li><strong>Standar Tinggi</strong> - Menetapkan target yang menantang</li>
</ul>
<p><strong>Indikator:</strong> Selalu berusaha memberikan yang terbaik, tidak puas dengan hasil yang biasa-biasa saja, dan terus mencari peluang untuk berkembang.</p>', 2, true),

('Kreativitas dan Inovasi', 'Kemampuan berpikir kreatif dan inovatif dalam menyelesaikan masalah', 'TKP',
'<h3>Kreativitas dan Inovasi</h3>
<p>Kreativitas adalah kemampuan menghasilkan ide-ide baru dan berguna:</p>
<ul>
<li><strong>Berpikir Out of the Box</strong> - Keluar dari pola pikir konvensional</li>
<li><strong>Fleksibilitas</strong> - Mudah beradaptasi dengan perubahan</li>
<li><strong>Originalitas</strong> - Menghasilkan ide yang unik</li>
<li><strong>Elaborasi</strong> - Mengembangkan ide menjadi solusi konkret</li>
</ul>
<p><strong>Cara Mengembangkan:</strong> Brainstorming, mind mapping, bertanya "bagaimana jika...", dan belajar dari berbagai disiplin ilmu.</p>', 3, true),

('Orientasi Pelayanan', 'Komitmen untuk memberikan pelayanan terbaik kepada masyarakat', 'TKP',
'<h3>Orientasi Pelayanan</h3>
<p>Orientasi pelayanan adalah sikap mengutamakan kepentingan yang dilayani:</p>
<ul>
<li><strong>Empati</strong> - Memahami kebutuhan dan perasaan orang lain</li>
<li><strong>Responsivitas</strong> - Cepat tanggap terhadap kebutuhan</li>
<li><strong>Proaktif</strong> - Mengantisipasi kebutuhan sebelum diminta</li>
<li><strong>Kualitas Layanan</strong> - Memberikan layanan yang memuaskan</li>
</ul>
<p><strong>Prinsip Pelayanan Prima:</strong> Tepat waktu, tepat sasaran, tepat prosedur, ramah, dan profesional.</p>', 4, true),

('Kemampuan Bekerja dalam Tim', 'Keterampilan berkolaborasi dan bekerja sama dengan orang lain', 'TKP',
'<h3>Kemampuan Bekerja dalam Tim</h3>
<p>Kerja tim yang efektif memerlukan:</p>
<ul>
<li><strong>Komunikasi Efektif</strong> - Menyampaikan dan menerima informasi dengan baik</li>
<li><strong>Saling Menghargai</strong> - Menghormati perbedaan pendapat dan latar belakang</li>
<li><strong>Komitmen Bersama</strong> - Berkomitmen pada tujuan tim</li>
<li><strong>Saling Mendukung</strong> - Membantu anggota tim lain saat diperlukan</li>
</ul>
<p><strong>Peran dalam Tim:</strong> Leader, contributor, challenger, implementer, completer, dan specialist.</p>', 5, true);

COMMIT;
