-- Insert passions for each subsection

-- 1. DEPORTE (Sports) - 6 passions
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(1, 'Fitness en el gimnasio (sin fanatismo)', 'Fitness at the gym (without fanaticism)', 'gym_fitness', 1),
(1, 'Tenis (jugué en el pasado, veo regularmente)', 'Tennis (played in the past, watch regularly)', 'tennis', 2),
(1, 'Bádminton', 'Badminton', 'badminton', 3),
(1, 'Boccia', 'Boccia', 'boccia', 4),
(1, 'Biatlón (veo regularmente)', 'Biathlon (watch regularly)', 'biathlon', 5),
(1, 'Caminatas (camino mucho)', 'Hiking (walk a lot)', 'hiking', 6);

-- 2. MÚSICA (Music) - 4 passions
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(2, 'Karaoke', 'Karaoke', 'karaoke', 1),
(2, 'Canto', 'Singing', 'singing', 2),
(2, 'Eurovisión', 'Eurovision', 'eurovision', 3),
(2, 'Música variada', 'Varied music', 'varied_music', 4);

-- 3. VIAJES (Travel) - 6 passions
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(3, '45+ países visitados', '45+ countries visited', 'countries_visited', 1),
(3, 'Monumentos y atracciones', 'Monuments and attractions', 'attractions', 2),
(3, 'Estambul', 'Istanbul', 'istanbul', 3),
(3, 'España', 'Spain', 'spain', 4),
(3, 'Nuevas culturas', 'New cultures', 'new_cultures', 5),
(3, 'Descubrimientos culinarios', 'Culinary discoveries', 'culinary_discoveries', 6);

-- 4. ARTE (Art) - 4 passions
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(4, 'Cinematografía seria', 'Serious cinematography', 'serious_cinema', 1),
(4, 'Premios (Oscar, festivales)', 'Awards (Oscar, festivals)', 'awards', 2),
(4, 'Series juveniles', 'Youth series', 'youth_series', 3),
(4, 'Arquitectura', 'Architecture', 'architecture', 4);

-- 5. TECNOLOGÍA (Technology) - 3 passions
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(5, 'Inteligencia artificial', 'Artificial intelligence', 'ai', 1),
(5, 'Cosmos (macro y micro)', 'Cosmos (macro and micro)', 'cosmos', 2),
(5, 'Análisis de datos', 'Data analytics', 'data_analytics', 3);

-- 6. NATURALEZA (Nature) - 4 passions
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(6, 'Senderismo', 'Hiking', 'hiking_nature', 1),
(6, 'Barbacoa', 'Barbecue', 'barbecue', 2),
(6, 'Montañas', 'Mountains', 'mountains', 3),
(6, 'Mar', 'Sea', 'sea', 4);

-- 7. CULINARIA (Culinary) - 5 passions
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(7, 'Me encanta cocinar', 'I love cooking', 'cooking', 1),
(7, 'Me encanta repostería', 'I love baking', 'baking', 2),
(7, 'Mariscos', 'Seafood', 'seafood', 3),
(7, 'Sushi', 'Sushi', 'sushi', 4),
(7, 'Decoración de mesa y recepción de huéspedes', 'Table decoration and hosting guests', 'hosting', 5);

-- Insert Voldy's selected passions to profile_passions
-- All passions are selected, so we insert all of them with their subsection info

-- DEPORTE (Sports)
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
(1, 7, 'Deporte', 'Sports', 1),
(2, 7, 'Deporte', 'Sports', 2),
(3, 7, 'Deporte', 'Sports', 3),
(4, 7, 'Deporte', 'Sports', 4),
(5, 7, 'Deporte', 'Sports', 5),
(6, 7, 'Deporte', 'Sports', 6);

-- MÚSICA (Music)
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
(7, 7, 'Música', 'Music', 7),
(8, 7, 'Música', 'Music', 8),
(9, 7, 'Música', 'Music', 9),
(10, 7, 'Música', 'Music', 10);

-- VIAJES (Travel)
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
(11, 7, 'Viajes', 'Travel', 11),
(12, 7, 'Viajes', 'Travel', 12),
(13, 7, 'Viajes', 'Travel', 13),
(14, 7, 'Viajes', 'Travel', 14),
(15, 7, 'Viajes', 'Travel', 15),
(16, 7, 'Viajes', 'Travel', 16);

-- ARTE (Art)
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
(17, 7, 'Arte', 'Art', 17),
(18, 7, 'Arte', 'Art', 18),
(19, 7, 'Arte', 'Art', 19),
(20, 7, 'Arte', 'Art', 20);

-- TECNOLOGÍA (Technology)
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
(21, 7, 'Tecnología', 'Technology', 21),
(22, 7, 'Tecnología', 'Technology', 22),
(23, 7, 'Tecnología', 'Technology', 23);

-- NATURALEZA (Nature)
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
(24, 7, 'Naturaleza', 'Nature', 24),
(25, 7, 'Naturaleza', 'Nature', 25),
(26, 7, 'Naturaleza', 'Nature', 26),
(27, 7, 'Naturaleza', 'Nature', 27);

-- CULINARIA (Culinary)
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
(28, 7, 'Culinaria', 'Culinary', 28),
(29, 7, 'Culinaria', 'Culinary', 29),
(30, 7, 'Culinaria', 'Culinary', 30),
(31, 7, 'Culinaria', 'Culinary', 31),
(32, 7, 'Culinaria', 'Culinary', 32);

-- Verify
SELECT 
  pp.id,
  pp.subsection_name_es,
  p.name_es,
  pp."order"
FROM profile_passions pp
JOIN passions p ON pp.passion_id = p.id
ORDER BY pp."order";
