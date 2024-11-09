-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 08 2024 г., 22:31
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `votesystem`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'adminZOV', '$2y$10$Hej2ptlXegdoMmlIdC751O68aC60Tz7TTQCpTgjineyNS6r.67B0e', 'Никита', 'Пиянзин', 'logo.png', '2018-04-02');

-- --------------------------------------------------------

--
-- Структура таблицы `candidates`
--

CREATE TABLE `candidates` (
  `id` int NOT NULL,
  `position_id` int NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `platform` mediumtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `candidates`
--

INSERT INTO `candidates` (`id`, `position_id`, `firstname`, `lastname`, `photo`, `platform`) VALUES
(18, 8, 'Владимир', 'Путин', 'RIA_8466512.HR.jpg', '1952 года рождения; место жительства - город Москва; Президент Российской Федерации; самовыдвижение'),
(19, 8, 'Слуцкий', 'Леонид', '1646441757640999_d_-PDCBI.jpg', '1968 года рождения; место жительства\r\nгород Москва;\r\nГосударственная Дума Федерального Собрания Российской\r\nФедерации, депутат, руководитель фракции Политической партии\r\nЛДПР - Либерально-демократической партии России, председатель\r\nКомитета Государственной Думы по международным делам;\r\nвыдвинут политической партией «Политическая партия ЛДПР\r\nЛиберально-демократическая партия России»; член политической\r\nпартии «Политическая партия ЛДПР - Либерально-демократическая\r\nпартия России», Руководитель Высшего Совета партии,\r\nПредседатель партии\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `positions`
--

CREATE TABLE `positions` (
  `id` int NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `max_vote` int NOT NULL,
  `priority` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `positions`
--

INSERT INTO `positions` (`id`, `description`, `max_vote`, `priority`) VALUES
(8, 'Презедент', 1, 2),
(9, 'Депутат гос совета', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `voters`
--

CREATE TABLE `voters` (
  `id` int NOT NULL,
  `voters_id` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `voters`
--

INSERT INTO `voters` (`id`, `voters_id`, `password`, `firstname`, `lastname`, `photo`) VALUES
(4, 'pPJGFSCBfsgm3dx', '$2y$10$.FZV9qn/F9mxiyl6TbvJDOUK8pGiGh0roLgmRPGybBADbVQlspGu6', 'Пользователь', 'Пользователь', 'venly.png');

-- --------------------------------------------------------

--
-- Структура таблицы `votes`
--

CREATE TABLE `votes` (
  `id` int NOT NULL,
  `voters_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  `position_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
