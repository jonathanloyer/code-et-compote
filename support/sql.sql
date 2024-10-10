CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    registration_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status ENUM('member', 'moderator', 'admin') NOT NULL DEFAULT 'member'
);

CREATE TABLE category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE topic (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    creation_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status ENUM('open', 'closed', 'pinned') NOT NULL DEFAULT 'open',
    user_id INT,
    category_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE message (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    publication_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modification_date DATETIME,
    user_id INT,
    topic_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (topic_id) REFERENCES Topic(id)
);

INSERT INTO user (username, email, password, status) VALUES
('CodeNinja', 'code.ninja@example.com', 'password1', 'member'),
('WebWizard', 'web.wizard@example.com', 'password2', 'member'),
('DevGuru', 'dev.guru@example.com', 'password3', 'member'),
('PixelPioneer', 'pixel.pioneer@example.com', 'password4', 'moderator'),
('ScriptSorcerer', 'script.sorcerer@example.com', 'password5', 'admin');

INSERT INTO category (name, description) VALUES
('HTML', 'Tout ce qui concerne HTML et les balises.'),
('CSS', 'Discussions sur les styles et la mise en page.'),
('JavaScript', 'Questions et ressources sur JavaScript.'),
('PHP', 'Discussions autour de PHP et du développement backend.'),
('Frameworks', 'Échanges sur les frameworks comme React, Vue.js, etc.');

INSERT INTO topic (title, user_id, category_id) VALUES
('Comment débuter avec HTML ?', 1, 1),
('Meilleures pratiques CSS', 2, 2),
('Introduction à JavaScript', 3, 3),
('Création d\'un site web avec PHP', 4, 4),
('Quel framework choisir ?', 5, 5),
('Sémantique HTML', 1, 1),
('Flexbox vs Grid', 2, 2),
('Gestion des événements en JavaScript', 3, 3),
('PHP et bases de données', 4, 4),
('Introduction à Bootstrap', 5, 5),
('SEO et HTML', 1, 1),
('Animations CSS', 2, 2),
('Promesses en JavaScript', 3, 3),
('Meilleures pratiques PHP', 4, 4),
('Découverte de Laravel', 5, 5),
('Accessibilité web', 1, 1),
('Responsive design', 2, 2),
('Déboguer JavaScript', 3, 3),
('APIs avec PHP', 4, 4),
('Vue.js pour les débutants', 5, 5);

INSERT INTO message (content, user_id, topic_id) VALUES
('Pour commencer, regardez des tutoriels en ligne.', 2, 1),
('Utilisez des balises sémantiques.', 1, 1),
('Je recommande le site MDN pour apprendre.', 3, 1),
('Pour CSS, commencez par des exercices pratiques.', 4, 2),
('Regardez des vidéos sur Flexbox.', 5, 2),
('Commencez par des projets simples.', 1, 3),
('Pratiquez avec des exercices sur le DOM.', 2, 3),
('Les promesses sont très utiles en JS.', 3, 3),
('Vous pouvez utiliser PDO pour la base de données.', 4, 4),
('Bootstrap simplifie le développement.', 5, 5),
('Utilisez les attributs ARIA.', 1, 1),
('Apprenez les bases du responsive design.', 2, 2),
('Débuguer avec les outils du navigateur est essentiel.', 3, 3),
('Laravel a une courbe d\'apprentissage, mais c\'est puissant.', 4, 4),
('Pour API, commencez par des tutos sur REST.', 5, 5),
('Le design responsive améliore l\'expérience utilisateur.', 1, 2),
('Les animations CSS ajoutent du dynamisme.', 2, 2),
('Un bon outil de débogage est indispensable.', 3, 3),
('Les bonnes pratiques sont importantes pour la sécurité.', 4, 4),
('Partagez vos projets pour obtenir des retours.', 5, 5),
('N\'oubliez pas de valider votre HTML.', 1, 1),
('Il existe des outils pour vérifier votre CSS.', 2, 2),
('Les tests unitaires sont importants en développement.', 3, 3),
('Prenez le temps de lire la documentation.', 4, 4),
('Les forums sont une excellente ressource.', 5, 5),
('Essayez d\'implémenter des projets personnels.', 1, 1),
('Participez à des hackathons pour pratiquer.', 2, 2),
('Ne vous découragez pas, ça prend du temps.', 3, 3),
('Cherchez des mentors pour vous guider.', 4, 4),
('Lisez des articles de blogs pour rester à jour.', 5, 5),
('Les communautés en ligne sont très utiles.', 1, 2),
('N\'hésitez pas à poser des questions.', 2, 3),
('Les discussions en ligne peuvent vous aider.', 3, 1),
('Les projets open source sont un bon début.', 4, 4),
('L\'apprentissage par la pratique est clé.', 5, 5),
('Ne sous-estimez pas le pouvoir du code propre.', 1, 1),
('Organisez vos fichiers et votre code.', 2, 2),
('Utilisez des outils de versionnage.', 3, 3),
('Ne négligez pas les tests.', 4, 4),
('Construisez un portfolio pour montrer vos compétences.', 5, 5),
('Prenez des notes pendant votre apprentissage.', 1, 2),
('Utilisez des ressources variées.', 2, 3),
('La documentation est votre amie.', 3, 1),
('Construisez un portfolio pour montrer vos compétences.', 4, 4),
('Ne soyez pas trop dur avec vous-même.', 5, 5);
