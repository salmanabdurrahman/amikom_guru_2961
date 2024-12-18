-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2024 at 02:40 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `android_amikom_2961`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nik_guru` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_guru` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password_guru` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `wa_guru` varchar(15) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nik_guru`, `nama_guru`, `password_guru`, `wa_guru`) VALUES
('190302684', 'Arif Nur Rohman', 'rahasia', '08990423789'),
('190302685', 'Budi Sudarsono', 'budi', '081336952939');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int NOT NULL,
  `kode_kelas` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_mapel` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nik_guru` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_guru` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_ajaran` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `semester` enum('ganjil','genap') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ganjil'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kode_kelas`, `nama_mapel`, `nik_guru`, `nama_guru`, `tahun_ajaran`, `semester`) VALUES
(1, 'XP8BF', 'Bahasa Pemrograman 2', '190302684', 'Arif Nur Rohman', '2024/2025', 'ganjil'),
(2, 'F8HPF', 'Bahasa Indonesia', '190302685', 'Budi Sudarsono', '2024/2025', 'ganjil'),
(3, 'YNTKT', 'Sistem Rekomendasi', '190302684', 'Arif Nur Rohman', '2024/2025', 'ganjil');

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int NOT NULL,
  `id_kelas` int NOT NULL,
  `judul_materi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `isi_materi` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id_materi`, `id_kelas`, `judul_materi`, `isi_materi`) VALUES
(1, 1, 'Pengenalan Android Kotlin', ''),
(2, 1, 'Eksplisit Intent dan Implisit Intent', ''),
(3, 2, 'Pengenalan Majaz dan Hiperbola', ''),
(4, 2, 'Membuat Kalimat Serapan', '');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int NOT NULL,
  `judul_pengumuman` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `isi_pengumuman` text COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_pengumuman` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id_pengumuman`, `judul_pengumuman`, `isi_pengumuman`, `tanggal_pengumuman`) VALUES
(1, 'Jadwal UTS Ganjil 2024', '', '2024-10-24 00:00:00'),
(2, 'Jadwal Pembayaran SPP 2024-2025', '', '2024-10-24 00:00:00'),
(3, 'Libur Natal dan Tahun Baru', '', '2024-10-24 00:00:00'),
(4, 'Acara Gelar Karya Mahasiwa Sistem Informasi', '', '2024-10-24 00:00:00'),
(5, 'Berhasil Belajar Android Arif Nur Rohman', '', '2024-10-24 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int NOT NULL,
  `id_kelas` int NOT NULL,
  `nis` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `id_kelas`, `nis`) VALUES
(1, 1, '18.12.0636'),
(2, 1, '18.12.0804'),
(3, 1, '20.12.1587'),
(4, 1, '20.12.1600'),
(5, 1, '20.12.1627'),
(6, 1, '20.12.1708'),
(7, 1, '23.12.2921'),
(8, 1, '23.12.2922'),
(9, 1, '23.12.2923'),
(10, 1, '23.12.2924'),
(11, 1, '23.12.2925'),
(12, 1, '23.12.2926'),
(13, 1, '23.12.2927'),
(14, 1, '23.12.2928'),
(15, 1, '23.12.2929'),
(16, 1, '23.12.2930'),
(17, 1, '23.12.2931'),
(18, 1, '23.12.2932'),
(19, 1, '23.12.2933'),
(20, 1, '23.12.2934'),
(21, 1, '23.12.2935'),
(22, 1, '23.12.2936'),
(23, 1, '23.12.2937'),
(24, 1, '23.12.2938'),
(25, 1, '23.12.2940'),
(26, 1, '23.12.2941'),
(27, 1, '23.12.2942'),
(28, 1, '23.12.2943'),
(29, 1, '23.12.2944'),
(30, 1, '23.12.2945'),
(31, 1, '23.12.2947'),
(32, 1, '23.12.2948'),
(33, 1, '23.12.2949'),
(34, 1, '23.12.2950'),
(35, 1, '23.12.2951'),
(36, 1, '23.12.2952'),
(37, 1, '23.12.2953'),
(38, 1, '23.12.2954'),
(39, 1, '23.12.2955'),
(40, 1, '23.12.2956'),
(41, 1, '23.12.2957'),
(42, 1, '23.12.2958'),
(43, 1, '23.12.2959'),
(44, 1, '23.12.2960'),
(45, 1, '23.12.2961'),
(46, 1, '23.12.2962'),
(47, 1, '23.12.2963'),
(48, 1, '23.12.2964'),
(49, 1, '23.12.2965'),
(50, 1, '23.12.2966'),
(51, 1, '23.12.2967'),
(52, 1, '23.12.2968'),
(53, 1, '23.12.2969'),
(54, 1, '23.12.2970'),
(55, 1, '23.12.2971'),
(56, 1, '23.12.2972'),
(57, 1, '23.12.2973'),
(58, 1, '23.12.2974'),
(59, 1, '23.12.2975'),
(60, 1, '23.12.2976'),
(61, 1, '23.12.2977'),
(62, 1, '23.22.2518'),
(63, 1, '23.66.2004'),
(64, 1, '23.66.2008'),
(65, 1, '23.66.2080'),
(66, 3, '18.12.0636'),
(67, 3, '18.12.0804'),
(68, 3, '20.12.1587'),
(69, 3, '20.12.1600'),
(70, 3, '20.12.1627'),
(71, 3, '20.12.1708'),
(72, 3, '23.12.2921'),
(73, 3, '23.12.2922'),
(74, 3, '23.12.2923'),
(75, 3, '23.12.2924'),
(76, 3, '23.12.2925'),
(77, 3, '23.12.2926'),
(78, 3, '23.12.2927'),
(79, 3, '23.12.2928'),
(80, 3, '23.12.2929'),
(81, 3, '23.12.2930'),
(82, 3, '23.12.2931'),
(83, 3, '23.12.2932'),
(84, 3, '23.12.2933'),
(85, 3, '23.12.2934'),
(86, 3, '23.12.2935'),
(87, 3, '23.12.2936'),
(88, 3, '23.12.2937'),
(89, 3, '23.12.2938'),
(90, 3, '23.12.2940'),
(91, 3, '23.12.2941'),
(92, 3, '23.12.2942'),
(93, 3, '23.12.2943'),
(94, 3, '23.12.2944'),
(95, 3, '23.12.2945'),
(96, 3, '23.12.2947'),
(97, 3, '23.12.2948'),
(98, 3, '23.12.2949'),
(99, 3, '23.12.2950'),
(100, 3, '23.12.2951'),
(101, 3, '23.12.2952'),
(102, 3, '23.12.2953'),
(103, 3, '23.12.2954'),
(104, 3, '23.12.2955'),
(105, 3, '23.12.2956'),
(106, 3, '23.12.2957'),
(107, 3, '23.12.2958'),
(108, 3, '23.12.2959'),
(109, 3, '23.12.2960'),
(110, 3, '23.12.2961'),
(111, 3, '23.12.2962'),
(112, 3, '23.12.2963'),
(113, 3, '23.12.2964'),
(114, 3, '23.12.2965'),
(115, 3, '23.12.2966'),
(116, 3, '23.12.2967'),
(117, 3, '23.12.2968'),
(118, 3, '23.12.2969'),
(119, 3, '23.12.2970'),
(120, 3, '23.12.2971'),
(121, 3, '23.12.2972'),
(122, 3, '23.12.2973'),
(123, 3, '23.12.2974'),
(124, 3, '23.12.2975'),
(125, 3, '23.12.2976'),
(126, 3, '23.12.2977'),
(127, 3, '23.22.2518'),
(128, 3, '23.66.2004'),
(129, 3, '23.66.2008'),
(130, 3, '23.66.2080');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `id_sesi` int NOT NULL,
  `kode_kelas` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `materi_sesi` text COLLATE utf8mb4_general_ci NOT NULL,
  `bahasan_sesi` text COLLATE utf8mb4_general_ci NOT NULL,
  `kode_sesi` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `ke_sesi` int NOT NULL DEFAULT '1',
  `tanggal_sesi` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`id_sesi`, `kode_kelas`, `materi_sesi`, `bahasan_sesi`, `kode_sesi`, `ke_sesi`, `tanggal_sesi`) VALUES
(1, 'XP8BF', 'Pengenalan Android', 'Linear Layout', 'VpNaV', 1, '2024-11-28 09:58:55'),
(2, 'XP8BF', 'Pengenalan Android', 'Linear Layout', '8CMdx', 1, '2024-11-28 10:04:09'),
(3, 'XP8BF', 'Pengenalan Android', 'Grid View', 'SYVo7', 2, '2024-11-28 10:04:51'),
(4, 'XP8BF', 'Layout', 'Layout linear dan constraint', 'GWspk', 2, '2024-12-05 09:08:10'),
(5, 'XP8BF', 'Linear Layout', 'Linear Layout', 'nG6wW', 2, '2024-12-05 09:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_siswa` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password_siswa` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `foto_siswa` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama_siswa`, `password_siswa`, `foto_siswa`) VALUES
('18.12.0636', 'MUHAMMAD ERDIANTO', '66091c36765cba848c5c8f72af88753dc5ad26d6', 'default.jpg'),
('18.12.0804', 'MUHAMMAD FATHURRAHMAN', '2213f251b570ef0a532e4c7850b0dd3bc4373adf', 'default.jpg'),
('20.12.1587', 'ERMIKKO SATRYA ABIMANYU', '3922f31d96212cbae36bdd7aaf1dce91f5c01e58', 'default.jpg'),
('20.12.1600', 'FENDI NUR SAID PUTRA PRAYITNO', 'd37705b23ad48014dde86d5fbd1b036511c9489b', 'default.jpg'),
('20.12.1627', 'MAURITS EDGAR STEVANO RENYUT', '3e5e573c27be4d4abeb8ee227a565170736c09e8', 'default.jpg'),
('20.12.1708', 'PRIYANTONO ABDULGANI', 'add03752defea69b25cd1e0ccfda6f3a7f82fb97', 'default.jpg'),
('23.12.2921', 'IVAN TRY ADIYATMA', '5396c90c04b7cc102a804b1bcba33c3be99005d4', 'default.jpg'),
('23.12.2922', 'TIRTA DHARMA SATYAWIRAWAN', 'd8bab07fdaf557605b0429ee19f775644476bab7', 'default.jpg'),
('23.12.2923', 'JOY RAPHAELA', 'bd8e47e9b36a44a1cdc8a65c23481f25cc6b4cd6', 'default.jpg'),
('23.12.2924', 'AZIZ MUSTOFA', '67262b3e5d1312397ada497267e8e2f2d4f62b78', 'default.jpg'),
('23.12.2925', 'PANJI IHSANUDIN FAJRI', '3102a94a3eea8871ada09f32051317ac0811315c', 'default.jpg'),
('23.12.2926', 'RAFIQY AFTA FADILAH', '25dc2ed3ded43e7bd4c75cc49ab8d360404d64c4', 'default.jpg'),
('23.12.2927', 'WAHYU HARI CAHYONO', '1226aecf17751d15498ad51fe90716ff2b276bc0', 'default.jpg'),
('23.12.2928', 'RIFAN MABEL TOFANI', 'affa39d3382589bca9342e37e9d2adf3eb128495', 'default.jpg'),
('23.12.2929', 'MEILA DIVA ZHAHARANI PUTRI', '8cd4e08138c618a81d1fec0b622833d8eb52f1ca', 'default.jpg'),
('23.12.2930', 'ILHAM AKBAR', 'bc2153f667a50147532767e1813b5091bbae37c1', 'default.jpg'),
('23.12.2931', 'SURYA FAZZAHARY', '8400779f3a94dadb5afdfe0314f2bfe60eceb27c', 'default.jpg'),
('23.12.2932', 'AFRA HABIBI', 'abdb04286e4b6d0fc52e1bde434b27e108d4930b', 'default.jpg'),
('23.12.2933', 'SERGIUS SEPTIADE MASMUR', 'f0a1f4c581449155d7ea4b4cdd27e5eb2c5d0962', 'default.jpg'),
('23.12.2934', 'RATU PERMATA INDAH', '337bc6ff3d1662ca280a1805146e496626c43a2a', 'default.jpg'),
('23.12.2935', 'HERDA RAFIF ARYA PUTRA', 'c6e1a72111f5867a37c28036b9ab116e58a7440b', 'default.jpg'),
('23.12.2936', 'DHIMAS RAMADHAN WICAKSONO', '261c3991c3f8bd61b5239e3078032774679a7b53', 'default.jpg'),
('23.12.2937', 'KRISTIANTO OTOBERI DE ROSARI LEVEN', '130885b19683e7461f78a45b01c626fd6e367b23', 'default.jpg'),
('23.12.2938', 'MIFTAH HANDIKA MIQO PRATAMA', 'd6137e9691b435ccf9d2fc72d0997e06f0dba7e6', 'default.jpg'),
('23.12.2940', 'RIZKI MAULANA', '2dc8a67ee6cc463b3cf07e4a63297f585e646fec', 'default.jpg'),
('23.12.2941', 'LENTERA AHES MEDA', 'ea53b43bdb910a2d606b204724f225bc2e4d8b6b', 'default.jpg'),
('23.12.2942', 'RETA NURAENI', 'f3059eaf48113acedccb58e4ca8100cfd18d2bff', 'default.jpg'),
('23.12.2943', 'MUHAMMAD RIZKY FIRMANSYAH', '3262a044cd74cae34432d95989833bb8598d0848', 'default.jpg'),
('23.12.2944', 'ATHAYA FAUZIYAH', '61889c147ef4475d3308aba1a335d183e3fa41de', 'default.jpg'),
('23.12.2945', 'NAUFAL MIFTAKHUL RIZKY', '1e98fcc254412b8ce4c435c9ae5c28ae34534641', 'default.jpg'),
('23.12.2947', 'DEDI BAGUS PRAWIRA', 'dd362a17e7c38e8cd2a3a51cf0279488dbd4e291', 'default.jpg'),
('23.12.2948', 'DICKY SAPUTRA', '43641ab10862ecc0fcf1dd58ba59684fcd229615', 'default.jpg'),
('23.12.2949', 'SANDIEGO BINTANG PAMBUDI', '677412e3c0bf16a49a7a29a8a03f43f3399de235', 'default.jpg'),
('23.12.2950', 'MUHAMMAD FACHMI SYAHRIAL', '91406b9df44bdf0462fe310ed80c8475f206def2', 'default.jpg'),
('23.12.2951', 'SALSABILA WIJOYO', '85ca356eeb607b431af61fd3bc4665d9fef27277', 'default.jpg'),
('23.12.2952', 'WISNU FADHILLAH', '7f5867f625bd55b29663c9d2b649f7947171be9c', 'default.jpg'),
('23.12.2953', 'MUHAMMAD BANGKIT NUR AZIZ', '35f46199aa88432ca961f277f6881cbf3bd3e65d', 'default.jpg'),
('23.12.2954', 'MUHAMMAD LUTHFI TAUFIQULHAKIM', 'c171a4d1cef856eb774c505a7977a163c74dfad3', 'default.jpg'),
('23.12.2955', 'ACHLIS MUFIDATUL LAILA', '622c6a1192f13bdc3da6a280900ca589b7bfff86', 'default.jpg'),
('23.12.2956', 'RAMA DANADIPA PUTRA WIJAYA', '82ece97a0c7fedbb05c461689ba192f53b0aeadb', 'default.jpg'),
('23.12.2957', 'MAZIRI AL`QISTHI', 'b3897677f0dc042f8ffca3d0cd21af6f08a2508d', 'default.jpg'),
('23.12.2958', 'FACHRIZA PRIMA YAHYA AFIADI', '487ac253f64c3004ca69060d71ad599ce103c4d2', 'default.jpg'),
('23.12.2959', 'WAHYU NUGROHO', '03cab8141d7c30d713483ac95d1dd19fc7772531', 'default.jpg'),
('23.12.2960', 'M. NABIL YUDHISTIRA', 'fb3990bdbfec207aca16de34d6b84d36a1ceb7bd', 'default.jpg'),
('23.12.2961', 'SALMAN ABDURRAHMAN', '303880e8be9fc6e2ab6422e7cbcd2f82dd196052', 'default.jpg'),
('23.12.2962', 'ZIDAN ZAIDAN', 'ff1e4727fee814da750c07edc73f853fb41d250d', 'default.jpg'),
('23.12.2963', 'MUHAMMAD IKHSAN FEBRIAN', 'deb45b078d13b5f4a852085fc8ae21afece46fc1', 'default.jpg'),
('23.12.2964', 'MUHAMMAD RIZKI', 'f76f88ab30b57cb875ce3c8c29d762487f7cd3ef', 'default.jpg'),
('23.12.2965', 'NICHOLAS SUSILO', '24cfff9932f31339c4db24d75bec00cad0478f1a', 'default.jpg'),
('23.12.2966', 'MARCELLINUS ALFRITS SORONGAN', 'b7484512700bd738a46c288af2123a5c4b4e0be2', 'default.jpg'),
('23.12.2967', 'ABRAR RAKHAPUTRA', 'dd305563bd641d0a88980c2d50f437bf8d171fdd', 'default.jpg'),
('23.12.2968', 'RAFIF FAIRUZ RAMADANI', '3f961771a6e093e5a2b0cb9fc9fa63ec6ce77bbd', 'default.jpg'),
('23.12.2969', 'ADHIMAS WIDHY PANGESTU', 'f513bc3217de2fccc51da2edc07e4daf684d654d', 'default.jpg'),
('23.12.2970', 'RENGGA DAFFA RADITYA', '817bddd9281a5d60ef8d21256378e9d13f26a609', 'default.jpg'),
('23.12.2971', 'PEPI ANGGRAINI', 'd094aa24f84f3275b827b0384eaa79a49509717f', 'default.jpg'),
('23.12.2972', 'WILDAN ULINNUHA', 'b3f11e40c61e274ac5b359af0409cd0e1298b0b5', 'default.jpg'),
('23.12.2973', 'MUHAMMAD FAHMI AZIZ SANJEEDA', '273b6830cdd922af0c2d64b67898aeb062e68af4', 'default.jpg'),
('23.12.2974', 'FEMA KUSUMANINGTYAS', '3998e76ecda7942b77048c37f1e05f8528347375', 'default.jpg'),
('23.12.2975', 'MUHAMMAD ABBAD RAID ALFATH', 'a27d6f95177e6fbed14c97f11da829680aba3d6e', 'default.jpg'),
('23.12.2976', 'ERSAN SANTOSO', 'f1a257f6dc31343ecb9079a4e285cefa85269b9e', 'default.jpg'),
('23.12.2977', 'REZA ANDRIANSAH', '26e3de60b8310fd5ed90d6e38a6702cc1a7d4e42', 'default.jpg'),
('23.22.2518', 'ADI WIJAYA', '345690ef7dcc9fbe035435645b38a532e936c66b', 'default.jpg'),
('23.66.2004', 'AIDIL AKBAR', '644a2ed1eedd6cb229fbeeae5ad199fc0265eb58', 'default.jpg'),
('23.66.2008', 'ALFIYANA DAMAYANTI', '7c15e17c22ac4ec96142bc11d396dc5726329f42', 'default.jpg'),
('23.66.2080', 'SYIFA MUTHMAINNAH ARIPUDDIN', 'ba77729598199d5d3975a1fa96421ed99d01d89c', 'default.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nik_guru`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`id_sesi`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `sesi`
--
ALTER TABLE `sesi`
  MODIFY `id_sesi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
