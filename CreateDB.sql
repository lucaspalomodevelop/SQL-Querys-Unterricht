
CREATE TABLE `fach` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `fach` (`id`, `name`) VALUES
(1, 'Mathe'),
(2, 'Informatik');


CREATE TABLE `klasse` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `klasse` (`id`, `name`) VALUES
(1, 'FI195'),
(2, 'SO195');


CREATE TABLE `lehrer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `lehrer` (`id`, `name`) VALUES
(1, 'Herbert'),
(2, 'Uschi');


CREATE TABLE `schueler` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `klasse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `schueler` (`id`, `name`, `klasse_id`) VALUES
(1, 'Lucas', 1),
(2, 'Bastian', 1),
(3, 'Antonia', 2),
(4, 'Klaus-Günther', 2);


CREATE TABLE `unterricht` (
  `fach_id` int(11) NOT NULL,
  `lehrer_id` int(11) NOT NULL,
  `klassen_id` int(11) NOT NULL,
  `Zeitpunkt` datetime NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `unterricht` (`fach_id`, `lehrer_id`, `klassen_id`, `Zeitpunkt`, `id`) VALUES
(1, 2, 1, '2022-03-22 08:00:00', 1),
(1, 1, 2, '2022-03-22 08:00:00', 2),
(2, 1, 1, '2022-03-22 09:30:00', 3),
(2, 2, 2, '2022-03-22 09:30:00', 4);

ALTER TABLE `fach`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `klasse`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lehrer`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `schueler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klasse_id` (`klasse_id`);

ALTER TABLE `unterricht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lehrer_id` (`lehrer_id`),
  ADD KEY `fach_id` (`fach_id`),
  ADD KEY `klassen_id` (`klassen_id`);

ALTER TABLE `fach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `klasse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `lehrer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `schueler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `unterricht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `schueler`
  ADD CONSTRAINT `schueler_ibfk_1` FOREIGN KEY (`klasse_id`) REFERENCES `klasse` (`id`);

ALTER TABLE `unterricht`
  ADD CONSTRAINT `unterricht_ibfk_1` FOREIGN KEY (`lehrer_id`) REFERENCES `lehrer` (`id`),
  ADD CONSTRAINT `unterricht_ibfk_2` FOREIGN KEY (`fach_id`) REFERENCES `fach` (`id`),
  ADD CONSTRAINT `unterricht_ibfk_3` FOREIGN KEY (`klassen_id`) REFERENCES `klasse` (`id`);
COMMIT;
