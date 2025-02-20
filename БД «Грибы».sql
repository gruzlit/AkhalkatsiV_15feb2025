#CREATE TABLE — команда «Создать таблицу»

CREATE TABLE mushrooms(
    mushroom_id   INT PRIMARY KEY,
    name          VARCHAR,
    description   TEXT,
    season         VARCHAR,
    edible         BOOLEAN,
    category_id       INT ,
    primary_region_id INT 
);

CREATE TABLE categories (
    category_id    INT PRIMARY KEY,
    name           VARCHAR,
    description     VARCHAR
);
 
CREATE TABLE regions (
    region_id       INT PRIMARY KEY,
    name             VARCHAR,
    description      TEXT,
    size             INT
);

#Наполняем таблицы
INSERT INTO regions (region_id, name, description, size )
VALUES
(10, 'Karelia', 'northwest russia', 180500),
(06, 'Ingushetia r.', 'south of russia', 3123),
(02, 'Bashkiria', 'republic in the Urals', 142947),
(53, 'Novgorod r.', 'central russia', 55300),
(50, 'Moscow r.', 'capital region', 44300),
(29, 'Arkhangelsk r.', 'north of russia', 589913);

INSERT INTO categories (category_id, name, description)
VALUES
(1, 'Tubular', 'White mushrooms' ),
(2, 'Lamellar', 'basidiomycetes');

INSERT INTO mushrooms (mushroom_id, name, description, season, edible, category_id, primary_region_id)
VALUES
(3, 'Боровик', 'Королевский', 'лето-осень', TRUE, 1, 10),
(4, 'Маслята', 'Маслянистая ш.', 'июнь-октябрь', TRUE, 1, 29),
(5, 'Подберезовик', 'Болотный', 'июль-октябрь', TRUE, 1, 10),
(6, 'Моховик', 'Нет кольца', 'август-октябрь', TRUE, 1, 29),
(7, 'Белый г.', 'Самый зн.', 'весна-лето', TRUE, 1, 06),
(8, 'Подосиновик', 'Ореховый аромат', 'лето-осень', TRUE, 1, 53),
(9, 'Боровик пр.', 'Не уп. в пищу', 'Не собирают', FALSE, 1, 53),
(10, 'Сыроежка', 'С цветочным ар.', 'июнь-октябрь', TRUE, 2, 02),
(11, 'Груздь', 'Мякоть твёрдая', 'июль-сентябрь', TRUE, 2, 06),
(12, 'Бледная поганка', 'Самый ядовитый', 'Не собирают', FALSE, 2, 50),
(13, 'Мухомор', 'Гриб-галлюциноген', 'Не собирают', FALSE, 2, 02),
(14, 'Рыжики', 'Желтого цвета', 'Июль-сентябрь', TRUE, 2, 10),
(15, 'Опята', 'Растут на пнях', 'лето-осень', TRUE, 2, 50),
(16, 'Майский гриб', 'бело-бежевые', 'весна', TRUE, 2, 06);

select * from mushrooms;

select * from categories;

select * from regions;

#1.Выберите уникальные регионы сбора грибов.
select name
from regions;

#2.Выведите название, сезон сбора и съедобность грибов, которые относятся к категории «Трубчатые».
select name,
       season,
	   edible
from mushrooms
where category_id = 1

#3.Посчитайте количество грибов для каждой категории. Выведите название категории и количество в порядке убывания.
SELECT c.name, count(*)
FROM mushrooms AS m
LEFT JOIN categories AS c
ON m.category_id = c.category_id
GROUP BY c.name
ORDER BY COUNT(*) DESC;

#4.Выведите название и описание съедобных грибов, которые лучше всего собирать в пяти самых больших по размеру (size) регионах.
select m.name, m.description
FROM mushrooms AS m
LEFT JOIN regions AS r
ON m.primary_region_id = r.region_id
WHERE r.size > 6000 AND m.edible = TRUE ;

#5.Выведите названия всех грибов, которые растут весной, относятся к категории «Пластинчатые»
и которые лучше всего собирать в местах размером до 6000 условных единиц (size).
select m.name
FROM mushrooms AS m
LEFT JOIN regions AS r
ON m.primary_region_id = r.region_id
WHERE r.size < 6000 AND m.season = 'весна' AND m.category_id = 2 ;