
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `competencia`;
CREATE TABLE `competencia` (
  `id_competencias` int(11) NOT NULL AUTO_INCREMENT,
  `competencia` text NOT NULL,
  `curso` int(11) NOT NULL,
  `año` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_competencias`),
  KEY `fk8` (`curso`),
  CONSTRAINT `fk8` FOREIGN KEY (`curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `docente` bigint(20) NOT NULL,
  `id_grado` int(11) NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `fk7_idx` (`id_grado`),
  KEY `fk16_idx` (`docente`),
  CONSTRAINT `fk16` FOREIGN KEY (`docente`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk7` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `ruc` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `empresa` VALUES ('1', 'Maria Parado', null, null, null);


DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `curso` int(11) NOT NULL,
  `grado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grado` (`grado`),
  KEY `materia` (`curso`) USING BTREE,
  CONSTRAINT `grado` FOREIGN KEY (`grado`) REFERENCES `grado` (`id_grado`),
  CONSTRAINT `materia` FOREIGN KEY (`curso`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `grado`;
CREATE TABLE `grado` (
  `id_grado` int(11) NOT NULL AUTO_INCREMENT,
  `grado` varchar(255) NOT NULL,
  `seccion` int(11) NOT NULL,
  PRIMARY KEY (`id_grado`),
  KEY `fk` (`seccion`),
  CONSTRAINT `fk` FOREIGN KEY (`seccion`) REFERENCES `seccion` (`id_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` longblob DEFAULT NULL,
  `grado` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `horario` (`grado`),
  CONSTRAINT `horario` FOREIGN KEY (`grado`) REFERENCES `grado` (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `institucion`;
CREATE TABLE `institucion` (
  `id_institucion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_institucion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `institucion` VALUES ('1', 'José Galvez', 'Somos la mejor institucion en el vraem', 'av. el ejercito', '978456321');


DROP TABLE IF EXISTS `materia`;
CREATE TABLE `materia` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante` bigint(20) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `nota1` decimal(10,0) DEFAULT NULL,
  `nota2` decimal(10,0) DEFAULT NULL,
  `nota3` decimal(10,0) DEFAULT NULL,
  `promedio` tinyint(10) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `anio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `fk10` (`curso`),
  KEY `fk11` (`semestre`),
  KEY `fk15_idx` (`estudiante`),
  CONSTRAINT `fk10` FOREIGN KEY (`curso`) REFERENCES `curso` (`id_curso`),
  CONSTRAINT `fk11` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`id_semestre`),
  CONSTRAINT `fk15` FOREIGN KEY (`estudiante`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `seccion`;
CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `seccion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `semestre`;
CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL AUTO_INCREMENT,
  `semestre` varchar(255) NOT NULL,
  `año` varchar(50) NOT NULL,
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `tipo_usuario` VALUES ('1', 'Administrador');
INSERT INTO `tipo_usuario` VALUES ('2', 'Docente');
INSERT INTO `tipo_usuario` VALUES ('3', 'Estudiante');


DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grado` int(11) DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk5` (`tipo`),
  KEY `fk6` (`grado`) USING BTREE,
  KEY `users` (`email`) USING BTREE,
  CONSTRAINT `fk14` FOREIGN KEY (`grado`) REFERENCES `grado` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk5` FOREIGN KEY (`tipo`) REFERENCES `tipo_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


