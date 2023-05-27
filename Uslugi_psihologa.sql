-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 27 2023 г., 20:29
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `услуги_психолога`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО клиента',
  `birthdate` date DEFAULT NULL COMMENT 'День рождения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `name`, `birthdate`) VALUES
(1, 'Иванов Михаил Васильевич', '1993-07-15'),
(2, 'Зубенко Владимир Константинович ', '2001-09-15'),
(3, 'Горбачева Анастасия Владимировна', '1998-02-02'),
(4, 'Соева Марина Павловна', '1988-07-02');

-- --------------------------------------------------------

--
-- Структура таблицы `notes_on_the_consultation`
--

CREATE TABLE `notes_on_the_consultation` (
  `id` int NOT NULL COMMENT 'ID консультации',
  `id_client` int DEFAULT NULL COMMENT 'ID клиента',
  `id_psychologist` int DEFAULT NULL COMMENT 'ID психолога',
  `consultation_date` datetime DEFAULT NULL COMMENT 'Дата консультации'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `notes_on_the_consultation`
--

INSERT INTO `notes_on_the_consultation` (`id`, `id_client`, `id_psychologist`, `consultation_date`) VALUES
(1, 3, 3, '2023-05-18 13:30:00'),
(2, 2, 1, '2023-05-13 19:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `psychologist`
--

CREATE TABLE `psychologist` (
  `id` int NOT NULL COMMENT 'ID психолога',
  `Name` varchar(255) NOT NULL COMMENT 'ФИО психолога',
  `consultation_price` int NOT NULL COMMENT 'Цена за консультацию'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `psychologist`
--

INSERT INTO `psychologist` (`id`, `Name`, `consultation_price`) VALUES
(1, 'Доловаров Афанасий Альбертович', 2300),
(2, 'Круглянцев Дмитрий Миаилович', 3000),
(3, 'Королев Василий Витальевич', 2500),
(4, 'Сухачева Елена Владимировна', 3000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notes_on_the_consultation`
--
ALTER TABLE `notes_on_the_consultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_psychologist` (`id_psychologist`);

--
-- Индексы таблицы `psychologist`
--
ALTER TABLE `psychologist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `notes_on_the_consultation`
--
ALTER TABLE `notes_on_the_consultation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID консультации', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `psychologist`
--
ALTER TABLE `psychologist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID психолога', AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `notes_on_the_consultation`
--
ALTER TABLE `notes_on_the_consultation`
  ADD CONSTRAINT `notes_on_the_consultation_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `notes_on_the_consultation_ibfk_2` FOREIGN KEY (`id_psychologist`) REFERENCES `psychologist` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
