----------------------------------------------
-- SQL CODE TO INITALISE TABLE FROM SCRATCH --
----------------------------------------------

-- DROP EVERYTHING
DROP TABLE IF EXISTS wk08_houseplants CASCADE;
DROP TABLE IF EXISTS wk08_houseplants_categories CASCADE;
DROP TABLE IF EXISTS wk08_categories CASCADE;
DROP TABLE IF EXISTS wk08_houseplants_comments CASCADE;
DROP TABLE IF EXISTS wk08_comments CASCADE;

-- CATEGORIES TABLE
CREATE TABLE IF NOT EXISTS wk08_categories (
    id SERIAL PRIMARY KEY,
    category VARCHAR(25) NOT NULL,
    img_url VARCHAR(500) NOT NULL
);

-- HOUSEPLANTS TABLE
CREATE TABLE IF NOT EXISTS wk08_houseplants (
    id SERIAL PRIMARY KEY,
    category INT NOT NULL,
        FOREIGN KEY (category) REFERENCES wk08_categories (id),
    common_name VARCHAR(50) NOT NULL,
    binomen VARCHAR(50) NOT NULL,
    img_url VARCHAR(500) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    temperature VARCHAR(500),
    light VARCHAR(500),
    water VARCHAR(500),
    humidity VARCHAR(500),
    repotting VARCHAR(500),
    flowering_care VARCHAR(500),
    propagation VARCHAR(500)
);

-- JUNCTION TABLE: wk08_houseplants_categories
CREATE TABLE IF NOT EXISTS wk08_houseplants_categories (
    houseplant_id INT NOT NULL,
        FOREIGN KEY (houseplant_id) REFERENCES wk08_houseplants (id) ON DELETE CASCADE,
    category_id INT NOT NULL,
        FOREIGN KEY (category_id) REFERENCES wk08_categories (id)
);

-- COMMENTS TABLE
CREATE TABLE IF NOT EXISTS wk08_comments (
    id SERIAL PRIMARY KEY,
    houseplant_id INT NOT NULL,
        FOREIGN KEY (houseplant_id) REFERENCES wk08_houseplants (id),
    username VARCHAR(30) NOT NULL,
    location VARCHAR(30) NOT NULL,
    comment VARCHAR(500) NOT NULL
);

-- JUNCTION TABLE: wk08_houseplants_comments
CREATE TABLE IF NOT EXISTS wk08_houseplants_comments (
    houseplant_id INT NOT NULL,
        FOREIGN KEY (houseplant_id) REFERENCES wk08_houseplants (id),
    comment_id INT NOT NULL,
        FOREIGN KEY (comment_id) REFERENCES wk08_comments (id) ON DELETE CASCADE
);

-- SEED TABLE: wk08_categories
INSERT INTO wk08_categories (id, category, img_url) VALUES
(1, 'Foliage Plants', 'https://i.imgur.com/BsC0cKC.png'),
(2, 'Flowering Plants', 'https://i.imgur.com/DiNuqEB.jpeg'),
(3, 'Succulents', 'https://i.imgur.com/dr9NInU.png'),
(4, 'Cacti', 'https://i.imgur.com/iIIGPQm.jpeg'),
(5, 'Edibles', 'https://i.imgur.com/3driV3X.jpeg');

-- SEED TABLE: wk08_houseplants
INSERT INTO wk08_houseplants (category, common_name, binomen, img_url, description, temperature, light, water, humidity, repotting, flowering_care, propagation) VALUES
(1, 'Swiss Cheese Plant', 'Monstera deliciosa', 'https://i.imgur.com/BsC0cKC.png', 'The Monstera deliciosa, commonly known as the Swiss Cheese Plant, is a tropical plant native to Central America. It is known for its large, glossy, heart-shaped leaves that develop unique, natural holes and splits as they mature, giving them a distinctive, perforated appearance. This plant is a popular houseplant due to its striking foliage and relatively easy care requirements, thriving in bright, indirect light and moderate watering. It can grow quite large, often needing support from a stake or trellis.', 'Average warmth, not less than 10°C in winter. Active growth starts at 18°C.', 'Keep out of direct sunlight. Choose a spot in light shade or moderate brightness.', 'From November to March keep the soil just moist - make sure it is not waterlogged. For the rest of the year, water thoroughly, but allow compost to become dryish between waterings.', 'Mist if room is heated. Occasionally wash and polish mature leaves.', 'Every 2 years transfer to a larger pot in spring.', 'Details coming soon!', 'When too tall remove tip in summer a the point just below an aerial root. Plant the cutting - the severed parent will continue to grow. Air layer as an alternative.'),
(2, 'Poinsettia', 'Euphorbia pulcherrima', 'https://i.imgur.com/DiNuqEB.jpeg', 'The poinsettia is a popular plant known for its vibrant red and green foliage, commonly associated with the Christmas season. Native to Mexico and Central America, the poinsettia features bright red bracts, which are often mistaken for petals but are actually modified leaves. The true flowers are small and yellow, located at the center of the bracts. Poinsettias thrive in bright, indirect light and prefer a slightly moist soil. They are widely used as decorative plants during the holiday season due to their festive appearance.', 'Average warmth, not less than 13°C - 15°C during the flowering season', 'Maximum light during winter; protect from hot summer sun if plant is to be kept for next Christmas.', 'Water thoroughly; wait until the compost is moderately dry before watering again. Water immediately if leaves begin to wilt. Water more liberally in summer.', 'Mist leaves frequently during the flowering season.', 'Details coming soon!', 'Plant should be discarded, but if you like a challenge it can be kept and will bloom again next Christmas. The lighting will have to be very carefully controlled in autumn.', 'Stem cuttings in early summer. Use a rooting hormone.'),
(3, 'String of hearts', 'Ceropegia woodii', 'https://i.imgur.com/fvXMVcg.png', 'The String of Hearts is a trailing succulent vine native to South Africa. It is cherished for its delicate, heart-shaped leaves that grow along thin, wiry stems. The leaves are typically green with silver marbling on the top and a purplish hue on the underside. This plant is easy to care for, preferring bright, indirect light and well-draining soil. Due to its cascading growth habit, it is often displayed in hanging baskets or on shelves where its stems can trail beautifully.', 'Average warmth from spring to autumn; succulents (unlike most houseplants) relish a marked different between night and day temperatures. Keep cool in winter; 13°C - 15°C is ideal but no harm will occur at 4°C.', 'A windowsill is the right spot, as some sunshine is vital. Choose a south-facing windowsill if you can, but some shade in summer may be necessary.', 'Treat as an ordinary houseplant from spring to autumn, watering thoroughly when the compost begins to dry out. In winter, water infrequently, once every 1-2 months.', 'No need to mist the leaves. The main requirement is for fresh air; open windows in summer.', 'Only repot when essential - then transfer to a slightly larger container spring. Use a shallow pot rather than a deep one.', 'Details coming soon!', 'Cuttings root easily. Take stem cuttings in spring or summer and place in water until roots develop, then pot in compost.'),
(4, 'Old Man of the Andes', 'Oreocerus celsianus', 'https://i.imgur.com/iIIGPQm.jpeg', 'The Old Man of the Andes is a striking cactus species native to the high altitudes of the Andes mountains in South America. It is easily recognized by its dense covering of long, white, hair-like spines that give it a shaggy, "old man" appearance. This protective covering helps shield the cactus from intense sunlight and cold temperatures. The Old Man of the Andes prefers bright, direct sunlight and well-draining soil, and it is drought-tolerant, requiring infrequent watering. It is a popular choice for cactus enthusiasts and adds a unique, textural element to succulent collections.', 'Average warmth from spring to autumn. Keep cool in winter; 13°C - 15°C is ideal but no harm will occur at 4°C. Windowsill plants should be brought into the room at night if the weather is very cold and there is no artificial heat.', 'Choose the sunniest spot available, especially in winter. In the greenhouse some shading may be necessary in the hottest months.', 'Increase watering in April and in the May-August period treat as an ordinary houseplant by watering thoroughly when the compost begins to dry out. Use tepid water. In late summer give less water and after mid October keep almost dry - just enough to prevent shrivelling.', 'Do not mist in the summer. The main requirement is for fresh air; open windows on hot summer days.', 'Repot annually when young; after that only repot when essential. Transfer in spring into a pot which is only slightly larger than the previous one.', 'Details coming soon!', 'Cuttings root easily. Take stem cuttings or offsets in spring or summer. it is vital to let cuttings dry for a few days before inserting in peat-based compost.'),
(3, 'Mexican Snowball', 'Echeveria harmsii', 'https://i.imgur.com/dLnFmzw.jpeg', 'The Mexican Snowball is a charming succulent native to Mexico. It is renowned for its rosette-shaped, pale blue-green leaves that are often tinged with pink or blush at the edges. These leaves are densely packed, forming a compact and symmetrical shape. During the winter months, mature plants can produce tall stalks bearing clusters of small, bell-shaped pinkish flowers that add to its allure. Mexican Snowballs thrive in bright sunlight and well-draining soil, making them ideal for rock gardens, containers, or as decorative accents in succulent arrangements. Their low maintenance needs and resilience to drought make them popular choices for both indoor and outdoor gardens.', 'Average warmth from spring to autumn; succulents (unlike most houseplants) relish a marked different between night and day temperatures. Keep cool in winter; 13°C - 15°C is ideal but no harm will occur at 4°C.', 'A windowsill is the right spot, as some sunshine is vital. Choose a south-facing windowsill if you can, but some shade in summer may be necessary.', 'Treat as an ordinary houseplant from spring to autumn, watering thoroughly when the compost begins to dry out. In winter, water infrequently, once every 1-2 months.', 'No need to mist the leaves. The main requirement is for fresh air; open windows in summer.', 'Only repot when essential - then transfer to a slightly larger container spring. Use a shallow pot rather than a deep one.', 'Details coming soon!', 'Remove leaves and wait to dry. Roots should soon form. Pot in compost.'),
(3, 'Painted Lady', 'Echeveria derenbergii', 'https://i.imgur.com/dr9NInU.png', 'Echeveria Painted Lady is a captivating succulent hybrid known for its striking foliage and rosette shape. This cultivar is prized for its leaves that display a mesmerizing blend of colors, ranging from pale silvery-green to pinkish-lavender with hints of peach and rose. The leaves often have a powdery coating (pruinose) that adds to their appeal.', 'Average warmth from spring to autumn; succulents (unlike most houseplants) relish a marked different between night and day temperatures. Keep cool in winter; 13°C - 15°C is ideal but no harm will occur at 4°C.', 'A windowsill is the right spot, as some sunshine is vital. Choose a south-facing windowsill if you can, but some shade in summer may be necessary.', 'Treat as an ordinary houseplant from spring to autumn, watering thoroughly when the compost begins to dry out. In winter, water infrequently, once every 1-2 months.', 'No need to mist the leaves. The main requirement is for fresh air; open windows in summer.', 'Only repot when essential - then transfer to a slightly larger container spring. Use a shallow pot rather than a deep one.', 'Details coming soon!', 'Remove leaves and wait to dry. Roots should soon form. Pot in compost.'),
(4, 'Bunny Ears Cacti', 'Opuntia microdasys', 'https://i.imgur.com/H9ktStZ.jpeg', 'Opuntia microdasys, commonly known as Bunny Ears or Bunny Cactus, is a charming and popular cactus species native to Mexico. It is named for its distinctive appearance, with pads that resemble the shape of bunny ears. These pads are oval to round in shape and covered with tiny, white glochids (hair-like spines) that give them a fuzzy texture. Despite its cute appearance, these glochids can be irritating to the skin, so handling with care is recommended.', 'Average warmth from spring to autumn. Keep cool in winter; 13°C - 15°C is ideal but no harm will occur at 4°C. Windowsill plants should be brought into the room at night if the weather is very cold and there is no artificial heat.', 'Choose the sunniest spot available, especially in winter. In the greenhouse some shading may be necessary in the hottest months.', 'Increase watering in April and in the May-August period treat as an ordinary houseplant by watering thoroughly when the compost begins to dry out. Use tepid water. In late summer give less water and after mid October keep almost dry - just enough to prevent shrivelling.', 'Do not mist in the summer. The main requirement is for fresh air; open windows on hot summer days.', 'Repot annually when young; after that only repot when essential. Transfer in spring into a pot which is only slightly larger than the previous one.', 'Details coming soon!', 'Cuttings root easily. Take stem cuttings or offsets in spring or summer. it is vital to let cuttings dry for a few days before inserting in peat-based compost.'),
(5, 'Dwarf Improved Meyer Lemon Tree', 'Citrus × meyeri', 'https://i.imgur.com/tuUYw4e.png', 'The Meyer lemon, is a small, compact citrus tree highly valued for its ornamental appeal and flavorful fruit. Originating from China, the Meyer lemon is a hybrid between a traditional lemon (Citrus limon) and a mandarin orange (Citrus reticulata), resulting in a sweeter and less acidic fruit compared to regular lemons. The tree typically reaches a manageable height of 6 to 10 feet but is often kept smaller through pruning and container growth, making it ideal for indoor cultivation. Its dark green foliage, fragrant white flowers, and vibrant yellow-orange fruit add aesthetic and aromatic value to homes and gardens.', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!'),
(1, 'Test Entry', 'Edit this entry for testing & dev purposes.', 'https://i.imgur.com/jjwTGX6.png', 'Some text.', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!', 'Details coming soon!');


-- SEED TABLE: wk08_houseplants_categories
INSERT INTO wk08_houseplants_categories (houseplant_id, category_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3),
(6, 3),
(7, 4),
(8, 5),
(9, 1);

-- SEED TABLE: wk08_comments
INSERT INTO wk08_comments (houseplant_id, username, location, comment) VALUES
(1, 'John Smith', 'London', 'My monstera keeps having brown leaves. Any advice on how I could stop this?'),
(1, 'Jane Doe', 'Leeds', 'Swiss cheese is yummy.'),
(1, 'John Smith', 'London', 'Jane, this is about a plant, not food.'),
(1, 'Jane Doe', 'Leeds', 'SWISS CHEESE IS VERY YUMMY!!!!!!'),
(1, 'John Smith', 'London', '...okay...'),
(1, 'John Smith', 'London', '...can anyone help answer my question???'),
(2, 'Plant Appreciator', 'Derby', 'I love the colour of them! So vibrant and Christmasy. Never knew the "red flowers" were actually coloured leaves that appear with a smaller flower!'),
(3, 'Succulents are awesome', 'Succulent Land', 'Mine grow like crazy!'),
(3, 'Sophie', 'Withernsea', 'So pretty! I really want one but my local garden centre never sells them :('),
(4, 'Cacti Critiquer', 'Coventry', 'He needs a haircut!'),
(4, 'houseplant_dude_2001', 'Barnsley', 'Wacky.'),
(5, 'Confused', 'Cottingham', 'i dont get why it is called a snowball...'),
(6, 'Sophie', 'Withernsea', 'My first succulent, a classic, such a pretty rosette shape!'),
(7, 'Sophie', 'Withernsea', 'My mum calls them "Mickey Mouse" cacti!'),
(8, 'John Smith', 'London', 'You can keep lemon trees indoors!?'),
(9, 'Tester', 'Test Place', 'Test comment.');



-- SEED TABLE: wk08_houseplants_comments
INSERT INTO wk08_houseplants_comments (houseplant_id, comment_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(5, 12),
(6, 13),
(7, 14),
(8, 15);


-- FUNCTION TO UPDATE TABLE wk08_houseplants_categories ALONG WITH wk08_houseplants
CREATE OR REPLACE FUNCTION update_wk08_houseplants_categories()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM wk08_houseplants_categories
    WHERE houseplant_id = NEW.id;
    INSERT INTO wk08_houseplants_categories (houseplant_id, category_id) VALUES
    (NEW.id, NEW.category);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- FUNCTION TRIGGERS FOR update_wk08_houseplants_categories
-- Insert new record
CREATE TRIGGER wk08_houseplants_insert
AFTER INSERT ON wk08_houseplants
FOR EACH ROW
EXECUTE FUNCTION update_wk08_houseplants_categories();

-- Update existing record
CREATE TRIGGER wk08_houseplants_update
AFTER UPDATE ON wk08_houseplants
FOR EACH ROW
EXECUTE FUNCTION update_wk08_houseplants_categories();


-- FUNCTION TO UPDATE TABLE wk08_houseplants_comments ALONG WITH wk08_comments
CREATE OR REPLACE FUNCTION update_wk08_houseplants_comments()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO wk08_houseplants_comments (comment_id, houseplant_id) VALUES
    (NEW.id, NEW.houseplant_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- FUNCTION TRIGGER FOR update_wk08_houseplants_comments
CREATE TRIGGER wk08_comments_insert
AFTER INSERT ON wk08_comments
FOR EACH ROW
EXECUTE FUNCTION update_wk08_houseplants_comments();