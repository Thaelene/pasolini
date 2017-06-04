-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Dim 04 Juin 2017 à 20:18
-- Version du serveur :  5.6.34
-- Version de PHP :  7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pasolini`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `sub_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `id_category`, `category`, `sub_category`) VALUES
(1, 1, 'film', 'trilogie_romaine'),
(2, 2, 'film', 'trilogie_romaine'),
(3, 3, 'film', 'religion'),
(4, 4, 'film', 'autres'),
(5, 5, 'film', 'religion'),
(6, 6, 'film', 'documentaire'),
(7, 7, 'film', 'trilogie_antique'),
(8, 8, 'film', 'autres'),
(9, 9, 'film', 'trilogie_antique'),
(10, 10, 'film', 'trilogie_de_la_vie'),
(11, 11, 'film', 'trilogie_de_la_vie'),
(12, 12, 'film', 'autres'),
(13, 13, 'roman', ''),
(14, 14, 'roman', ''),
(15, 15, 'roman', ''),
(16, 16, 'roman', ''),
(17, 17, 'essai', ''),
(18, 18, 'essai', '');

-- --------------------------------------------------------

--
-- Structure de la table `works`
--

CREATE TABLE `works` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `release_year` year(4) NOT NULL,
  `length` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `score` int(11) NOT NULL,
  `sub_categories` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `works`
--

INSERT INTO `works` (`id`, `title`, `release_year`, `length`, `category`, `description`, `score`, `sub_categories`, `slug`, `picture`) VALUES
(1, 'Accattone', 1961, 115, 'Film', 'Accattone (mendiant en italien) est un petit proxénète de banlieue qui fait travailler Maddalena. Ils vivent plus ou moins chez Nannina, l\'épouse de Cicio, l\'ancien souteneur de Maddalena qui a été dénoncé et purge une peine en prison. Un jour arrivent des amis de Cicio qui viennent régler un compte avec Accattone et Maddalena. Ils font boire Accattone puis emmènent Maddalena qu\'ils frappent et abandonnent. Celle-ci se retrouve entre les mains de la police et Accattone par conséquent sans gagne-pain. Celui-ci traîne sans argent, essaye d\'en trouver en allant voir son ancienne épouse qu\'il avait abandonnée avec son enfant. Celle-ci le rejette et sa famille le met dehors. Peu avant, il avait croisé Stella, une jeune fille pure et naïve. Lorsqu\'il la recroisera, Accattone entreprendra de la séduire pour l\'amener à se prostituer. Maddalena apprenant qu\'Accattone a une nouvelle protégée décide, par vengeance, de le dénoncer. Mais Accattone séduit par la pureté de Stella ne parvient plus à être le proxénète qu\'il était…', 7, 'trilogie_romaine', 'accattone', '../../server/movies/accattone.jpg'),
(2, 'Mamma Roma', 1962, 110, 'Film', 'Mamma Roma, prostituée romaine d\'une quarantaine d\'années, pense être libérée de son jeune souteneur, Carmine, qui se marie. Elle tente de refaire sa vie et reprend avec elle son fils Ettore, âgé de seize ans, qui ignore son passé et a grandi à la campagne, à Guidonia Montecelio près de Rome. Ils emménagent dans un appartement d\'une cité nouvelle du quartier Don Bosco qu\'elle rêve idéale. Mamma Roma travaille désormais comme vendeuse sur un petit marché de la via Tuscolana, pleine d\'espoir pour Ettore et dans la nouvelle vie qui commence. Ettore fait la connaissance des adolescents du quartier, qui traînent, désœuvrés, dans le terrain vague devant la cité, sous un soleil de plomb...', 7, 'trilogie_romaine', 'mamma-roma', '../../server/movies/mamma-roma.jpg'),
(3, 'La Ricotta', 1963, 40, 'Film', 'Un réalisateur reconnu tourne une version de la Passion du Christ. Sur le plateau entre les prises, les acteurs passent le temps. L\'un d\'entre eux, Stracci n\'a qu\'une idée en tête : trouver à manger…', 7, 'religion', 'la-ricotta', '../../server/movies/la-ricotta.jpg'),
(4, 'La Rage', 1963, 50, 'Film', 'Montage d\'archives d\'actualité des années 1950 et 1960.', 7, 'autres', 'la-rage', '../../server/movies/la-rage.jpeg'),
(5, 'L\'évangile selon Saint-Matthieu', 1964, 133, 'Film', 'Reconstitution fidèle de l\'évangile éponyme qui reprend une sélection de scènes de l\'histoire de la vie du Christ, de l\'Annonciation à la Passion.', 9, 'religion', 'levangile-selon-saint-matthieu', '../../server/movies/levangile.jpg'),
(6, 'Enquête sur la sexualité', 1964, 90, 'Film', 'Le cinéaste Pier Paolo Pasolini parcourt l\'Italie et interroge plusieurs franges de la population sur leur approche de la sexualité. Quatre chapitres, «Friture à l\'italienne», «L\'homosexualité», «L\'Italie vraie» et «Monument à l\'Italie des années 60», ponctuent cette enquête au cours de laquelle interviennent notamment le psychologue Cesare Musatti et l\'écrivain Alberto Moravia. De l\'homosexualité à la prostitution, du mariage à l\'infidélité, toutes les facettes de la sexualité des Italiens sont passées au crible...', 9, 'documentaire', 'enquete-sur-la-sexualite', '../../server/movies/enquete-sur-la-sexualite.jpeg'),
(7, 'Oedipe roi', 1967, 104, 'Film', 'Dans une famille bourgeoise de Lombardie des années vingt, un enfant naît, Oedipe. Jaloux de l\'amour que lui porte sa femme, son père l\'abandonne.\\r\\nDevenu adulte, Oedipe, ignorant sa véritable identité, tue son père et s\'éprend de sa mère sans savoir qui elle est.', 8, 'trilogie_antique', 'oeidipe-roi', '../../server/movies/oedipe-roi.jpeg'),
(8, 'Théorème', 1968, 98, 'Film', '« Dans une famille bourgeoise, arrive un personnage mystérieux qui est l\'amour divin. C\'est l\'intrusion du métaphysique, de l\'authentique, qui vient détruire, bouleverser une vie, qui est entièrement inauthentique, même si elle peut faire pitié, si elle peut même avoir des instants d\'authenticité dans les sentiments, par exemple, dans ses aspects physiques aussi. » Puis, un nouveau télégramme annonce le départ de cet étrange visiteur. « Et chacun, dans l\'attente, dans le souvenir, comme apôtre d\'un Christ non crucifié mais perdu, a son destin. C\'est un théorème et chaque destin est son corollaire. »\\r\\nPasolini', 7, 'autres', 'theoreme', '../../server/movies/theoreme.jpg'),
(9, 'Médée', 1969, 107, 'Film', 'Le centaure Chiron apprend à son élève Jason qu\'il est l\'héritier du trône de Thessalie. Il réclame son dû au Roi Pélias, qui lui promet la couronne en échange de la Toison d\'Or, symbole de prospérité gardé en Colchide. Séduite par Jason, Médée la fille du roi de Colchide l\'aide à voler le trésor et s\'enfuit avec. Ils se réfugient à Corinthe, où règne Créon. Dix ans après, Jason s\'éprend de la fille de Créon. La vengeance de Médée, mère de deux enfants, sera terrible…', 10, 'trilogie_antique', 'medee', '../../server/movies/medee.jpg'),
(10, 'Le Décaméron', 1971, 112, 'Film', 'Un film composé de huit sketches adaptés des fameux contes paillards de Boccace. Les protagonistes sont :\\r\\nun jeune marchand qui aide des voleurs à piller la tombe d\'un cardinal, un bûcheron qui tente de se faire engager comme jardinier dans une communauté de religieuses, une femme infidèle qui cherche à dissimuler à son mari la présence de son amant, un libertin qui abuse d\'un innocent moine, deux jeunes gens surpris par le père de celle-ci, deux profiteurs ayant peur de l\'enfer ainsi qu\'un prêtre qui prétend pouvoir transformer une femme en jument.', 7, 'trilogie_de_la_vie', 'le-decameron', '../../server/movies/el-decameron.jpg'),
(11, 'Les contes de Canterbury', 1972, 118, 'Film', 'Le film est une adaptation de huit des vingt-quatre Contes de Canterbury : Le Conte du Marchand, Le Conte du Frère mendiant, Le Conte du Cuisinier (Pasolini développe abondamment ce conte abandonné par Chaucer après seulement une cinquantaine de vers), Le Conte du Meunier, le prologue du Conte de la Bourgeoise de Bath (mais pas le conte en lui-même), Le Conte du Régisseur, Le Conte du Vendeur d\'indulgences et Le Conte de l\'Huissier d\'église. Contrairement au texte original, le lien entre les contes n\'est pas assuré par les interactions entre les pèlerins, mais par la seule personne de Chaucer, que l\'on voit occupé à leur rédaction.', 7, 'trilogie_de_la_vie', 'les-contes-de-canterbury', '../../server/movies/les-contes-de-canterbury.jpg'),
(12, 'Salò ou les 120 jours de Sodome', 1975, 117, 'Film', 'En 1943, dans la république fasciste fantoche de Salò, quatre riches notables enlèvent neuf jeunes garçons et neuf jeunes filles de la région pour les emprisonner dans un somptueux palais. Dans ce décor luxueux, les adolescents seront soumis aux plaisirs de leurs geôliers, à leur jouissance sadique de pouvoir exercer une domination totale sur ces jeunes corps, de décider de leurs souffrances, de leur survie ou de leur mort…', 7, 'autres', 'salo-ou-les-120-jours-de-sodome', '../../server/movies/salo.jpg'),
(13, 'Les Ragazzi', 1955, 315, 'Roman', 'L\'histoire se déroule dans la Rome de l\'après-guerre. Les personnages sont des adolescents du sous-prolétariat urbain qui vivent au jour le jour d\'expédients, en s\'arrangeant comme ils peuvent et en cherchant à mettre la main sur n\'importe quel type d\'objet qui peut être revendu. Leurs seuls loisirs sont des bains dans la saleté du Tibre et les fontaines.\\r\\n\\r\\nLe roman raconte l\'histoire du Frisé, surnom d\'un gamin des rues que l\'on découvre en 1943 lors de sa première communion et de sa confirmation. Peu après, on voit Le Frisé voler un mendiant aveugle. Dans les années qui suivent, le lecteur voit Le Frisé passer de vol en escroquerie et se prostituer, tandis que ses compagnons sont tués ou meurent. Le Frisé est finalement arrêté et mis en prison après avoir tenté de voler du fer pour acheter à sa fiancée une bague de fiançailles. Une fois relâché, il revient à la vie de la rue.\\r\\n\\r\\nPasolini dépeint Le Frisé et ses pareils comme des vagabonds par nature. Ils n\'ont pas de projet de vie ni de but et ne s\'en soucient pas. Le Frisé est le plus perdu d\'entre eux. Pasolini décrit des gens hors de la modernité, seuls restes d\'un monde disparu. Ce sont les voleurs, les amoraux, les marginaux, les joueurs : le rebut de la société.', 7, '', 'les-ragazzi', '../../server/novels/les-ragazzi.jpg'),
(14, 'Une vie violente', 1959, 355, 'Roman', 'Tommasino vit dans la « zone » de Rome avec une bande de garnements qui découvrent la vie sous ses aspects les plus cruels: misère, maladie, faim, vol, prostitution, mort. Il devient un de ces « vitelloni » qui chassent les filles, volent des voitures, se livrent à des attaques à main armée. II est condamné à deux ans de prison. Lorsqu\'il en sort - il a vingt ans - il s\'inscrit au parti communiste et décide de se ranger. Mais il est tuberculeux et après avoir sauvé une jeune fille de la noyade, il meurt. Cette vie brève et violente est décrite avec un réalisme et une vigueur inoubliables -et l\'on comprend que le roman ait d\'emblée accédé au rang de best-seller - alors que P.P. Pasolini se classe parmi les meilleurs écrivains italiens d\'aujourd\'hui.', 7, '', 'une-vie-violente', '../../server/novels/une-vie-violente.jpg'),
(15, 'Théorème', 1978, 184, 'Roman', 'Un jeune homme fait irruption chez de riches bourgeois milanais. Il est la grâce, la beauté mêmes. Et sa visite est davantage une visitation, qui s\'accomplit dans et par la possession physique. La servante Émilie, puis Pierre, le fils de famille, puis la mère et Odette, la fille, enfin le père, tous connaîtront le visiteur, au sens biblique du terme. Mais après son brusque départ, rien ne restera du message laissé. Seule l\'humble servante connaîtra le salut car, à la différence des bourgeois selon Pasolini, elle n\'a pas substitué de conscience à son âme, ni de morale à son sens du sacré.\\r\\nConçu comme pièce en vers dont il reste des extraits, puis écrit parallèlement au film, séquence par séquence, Théorème est une parabole, d\'un genre littéraire unique et inclassable.', 8, '', 'theoreme-roman', '../../server/novels/theoreme-roman.jpg'),
(16, 'Pétrole', 1992, 624, 'Roman', '«En projetant et en commençant d\'écrire mon roman, j\'ai bien réalisé autre chose que de projeter et d\'écrire mon roman : j\'ai organisé en moi le sens et la fonction de la réalité ; et une fois que j\'ai organisé le sens et la fonction de la réalité, j\'ai essayé de m\'emparer de la réalité. M\'emparer, peut-être, sur le plan doux et intellectuel de la connaissance ou de l\'expression ; mais malgré tout, essentiellement, brutalement et violemment, comme cela se passe pour chaque possession, pour chaque conquête.\\r\\n[...] Au moment même où je projetais et écrivais mon roman, autrement dit où je recherchais le sens de la réalité et en prenais possession, précisément dans l\'acte créatif que tout cela impliquait, je désirais aussi me libérer de moi-même, c\'est-à-dire mourir. Mourir dans ma création : mourir comme en effet on meurt, en accouchant : mourir, comme en effet on meurt, en éjaculant dans le ventre maternel.» Pier Paolo Pasolini.', 9, '', 'petrole', '../../server/novels/petrole.gif'),
(17, 'Ecrits corsaires', 1976, 288, 'Essai', 'Les textes ici rassemblés témoignent, par leur violence polémique d\'une démarche provocatrice. Mais chez Pasolini la volonté de ne rien dissimuler dans sa recherche de la vérité est sa seule provocation. L\'auteur de Théorème examine tour à tour le problème de l\'avortement, le fascisme, l\'antifascisme et surtout la société de consommation de masse qui conduit à la déshumanisation de la\\r\\nsociété et à la destruction de l\'identité italienne.', 7, '', 'ecrits-corsaires', '../../server/novels/ecrits-corsaires.jpg'),
(18, 'Lettres luthériennes', 1976, 244, 'Essai', 'Durant l\'année 1975, dernière de sa vie, Pasolini, âgé de 53 ans, s\'adresse dans le quotidien Il Corriere della sera, à un jeune homme imaginaire pour faire son éducation sociale et politique. Ce dialogue ouvert prend de l\'ampleur, et devient un véritable « petit traité pédagogique » au sujet de la presse, la sexualité, l’anticonformisme, la liberté, l\'école, la télévision... Il se prolonge par un poème et par différentes interventions dans lesquelles le cinéaste-écrivain exprime sa conception du monde et de la création, de la vie littéraire et de la participation politique. Paradoxes ou déclarations provocantes alternent dans cet essai vibrant, où Pasolini prend aussi le temps d\'analyser en profondeur la vie sociale italienne. Véritable bréviaire de la révolte, les Lettres luthériennes s\'inscrivent dans une lignée d\'essais comme les Écrits corsaires, l\'Expérience hérétique, Descriptions de descriptions.', 8, '', 'lettres-lutheriennes', '../../server/novels/lettres-lutheriennes.jpg');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT pour la table `works`
--
ALTER TABLE `works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
