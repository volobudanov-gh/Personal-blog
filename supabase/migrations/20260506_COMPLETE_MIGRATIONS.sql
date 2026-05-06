-- ====================================================================================================
-- PERSONAL BLOG - ПОЛНЫЕ SQL МИГРАЦИИ
-- ====================================================================================================
-- Дата: 6 мая 2026
-- Проект: Personal Blog (Dating Profile)
-- Описание: Полная структура БД профиля с подсекциями (языки, ценности, черты, страсти)
-- ====================================================================================================

-- ====================================================================================================
-- МИГРАЦИЯ 1: БАЗОВАЯ СТРУКТУРА (profile_sections, profile_fields)
-- ====================================================================================================

-- Создание таблицы profile_sections (7 разделов профиля)
CREATE TABLE IF NOT EXISTS profile_sections (
  id BIGSERIAL PRIMARY KEY,
  section_name_es TEXT NOT NULL UNIQUE,
  section_name_en TEXT NOT NULL UNIQUE,
  "order" INTEGER NOT NULL UNIQUE,
  icon TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Создание таблицы profile_fields (20 основных полей)
CREATE TABLE IF NOT EXISTS profile_fields (
  id BIGSERIAL PRIMARY KEY,
  field_name TEXT NOT NULL UNIQUE,
  label_es TEXT NOT NULL,
  label_en TEXT NOT NULL,
  section_id BIGINT NOT NULL REFERENCES profile_sections(id) ON DELETE CASCADE,
  data_type TEXT DEFAULT 'text',
  value TEXT,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- INSERT profile_sections
INSERT INTO profile_sections (section_name_es, section_name_en, "order", icon) VALUES
('Información Básica', 'Basic Information', 1, 'user'),
('Características Físicas', 'Physical Characteristics', 2, 'body'),
('Astrología', 'Astrology', 3, 'star'),
('Estilo de Vida', 'Lifestyle', 4, 'activity'),
('Educación y Profesión', 'Education & Profession', 5, 'briefcase'),
('Personalidad', 'Personality', 6, 'heart'),
('Mis Pasiones', 'My Passions', 7, 'flame')
ON CONFLICT DO NOTHING;

-- ====================================================================================================
-- МИГРАЦИЯ 2: ЯЗЫКИ (languages, proficiency_levels, profile_languages)
-- ====================================================================================================

-- Создание таблицы languages
CREATE TABLE IF NOT EXISTS languages (
  id BIGSERIAL PRIMARY KEY,
  name_es TEXT NOT NULL UNIQUE,
  name_en TEXT NOT NULL UNIQUE,
  code TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Создание таблицы proficiency_levels
CREATE TABLE IF NOT EXISTS proficiency_levels (
  id BIGSERIAL PRIMARY KEY,
  level_key TEXT UNIQUE NOT NULL,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Создание таблицы profile_languages (подсекция раздела 5)
CREATE TABLE IF NOT EXISTS profile_languages (
  id BIGSERIAL PRIMARY KEY,
  language_id BIGINT NOT NULL REFERENCES languages(id) ON DELETE CASCADE,
  proficiency_level_id BIGINT NOT NULL REFERENCES proficiency_levels(id) ON DELETE CASCADE,
  section_id BIGINT NOT NULL REFERENCES profile_sections(id) ON DELETE CASCADE,
  subsection_name_es TEXT DEFAULT 'Idiomas',
  subsection_name_en TEXT DEFAULT 'Languages',
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- INSERT languages
INSERT INTO languages (name_es, name_en, code) VALUES
('Ucraniano', 'Ukrainian', 'uk'),
('Ruso', 'Russian', 'ru'),
('Inglés', 'English', 'en'),
('Español', 'Spanish', 'es'),
('Polaco', 'Polish', 'pl')
ON CONFLICT DO NOTHING;

-- INSERT proficiency_levels
INSERT INTO proficiency_levels (level_key, name_es, name_en, "order") VALUES
('native', 'Nativo', 'Native', 1),
('fluent', 'Fluido', 'Fluent', 2),
('intermediate', 'Intermedio', 'Intermediate', 3),
('basic', 'Básico', 'Basic', 4)
ON CONFLICT DO NOTHING;

-- INSERT profile_languages (Voldy's languages)
INSERT INTO profile_languages (language_id, proficiency_level_id, section_id, "order") VALUES
(1, 1, 5, 4),  -- Ucraniano - Nativo
(2, 1, 5, 5),  -- Ruso - Nativo
(3, 2, 5, 6),  -- Inglés - Fluent
(4, 3, 5, 7),  -- Español - Intermediate
(5, 3, 5, 8)   -- Polaco - Intermediate
ON CONFLICT DO NOTHING;

-- CREATE INDEXES
CREATE INDEX IF NOT EXISTS idx_profile_languages_language_id ON profile_languages(language_id);
CREATE INDEX IF NOT EXISTS idx_profile_languages_section_id ON profile_languages(section_id);

-- ====================================================================================================
-- МИГРАЦИЯ 3: ЦЕННОСТИ (values, profile_values)
-- ====================================================================================================

-- Создание таблицы values
CREATE TABLE IF NOT EXISTS values (
  id BIGSERIAL PRIMARY KEY,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Создание таблицы profile_values (подсекция раздела 6)
CREATE TABLE IF NOT EXISTS profile_values (
  id BIGSERIAL PRIMARY KEY,
  value_id BIGINT NOT NULL REFERENCES values(id) ON DELETE CASCADE,
  section_id BIGINT NOT NULL REFERENCES profile_sections(id) ON DELETE CASCADE,
  subsection_name_es TEXT DEFAULT 'Valores',
  subsection_name_en TEXT DEFAULT 'Values',
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- INSERT values (30 ценностей)
INSERT INTO values (name_es, name_en, code) VALUES
('Honestidad', 'Honesty', 'honesty'),
('Familia', 'Family', 'family'),
('Amor', 'Love', 'love'),
('Lealtad', 'Loyalty', 'loyalty'),
('Confianza', 'Trust', 'trust'),
('Independencia', 'Independence', 'independence'),
('Libertad', 'Freedom', 'freedom'),
('Ambiciones', 'Ambition', 'ambition'),
('Éxito', 'Success', 'success'),
('Carrera', 'Career', 'career'),
('Creatividad', 'Creativity', 'creativity'),
('Autodesarrollo', 'Self-Development', 'self_development'),
('Educación', 'Education', 'education'),
('Conocimiento', 'Knowledge', 'knowledge'),
('Salud', 'Health', 'health'),
('Actividad Física', 'Physical Activity', 'physical_activity'),
('Estabilidad Financiera', 'Financial Stability', 'financial_stability'),
('Comodidad Material', 'Material Comfort', 'material_comfort'),
('Aventura', 'Adventure', 'adventure'),
('Viajes', 'Travel', 'travel'),
('Naturaleza', 'Nature', 'nature'),
('Ayudar a Otros', 'Helping Others', 'helping_others'),
('Justicia', 'Justice', 'justice'),
('Responsabilidad', 'Responsibility', 'responsibility'),
('Espiritualidad', 'Spirituality', 'spirituality'),
('Balance de Vida', 'Life Balance', 'life_balance'),
('Crecimiento Personal', 'Personal Growth', 'personal_growth'),
('Autenticidad', 'Authenticity', 'authenticity'),
('Paz', 'Peacefulness', 'peacefulness'),
('Fidelidad a Uno Mismo', 'Loyalty to Oneself', 'loyalty_to_oneself')
ON CONFLICT DO NOTHING;

-- INSERT profile_values (Voldy's values)
INSERT INTO profile_values (value_id, section_id, "order") VALUES
(2, 6, 1),   -- Familia
(5, 6, 2),   -- Confianza
(12, 6, 3),  -- Autodesarrollo
(15, 6, 4),  -- Salud
(26, 6, 5)   -- Balance de Vida
ON CONFLICT DO NOTHING;

-- CREATE INDEXES
CREATE INDEX IF NOT EXISTS idx_profile_values_value_id ON profile_values(value_id);
CREATE INDEX IF NOT EXISTS idx_profile_values_section_id ON profile_values(section_id);

-- ====================================================================================================
-- МИГРАЦИЯ 4: ЧЕРТЫ ХАРАКТЕРА (character_traits, profile_character_traits)
-- ====================================================================================================

-- Создание таблицы character_traits
CREATE TABLE IF NOT EXISTS character_traits (
  id BIGSERIAL PRIMARY KEY,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Создание таблицы profile_character_traits (подсекция раздела 6)
CREATE TABLE IF NOT EXISTS profile_character_traits (
  id BIGSERIAL PRIMARY KEY,
  character_trait_id BIGINT NOT NULL REFERENCES character_traits(id) ON DELETE CASCADE,
  section_id BIGINT NOT NULL REFERENCES profile_sections(id) ON DELETE CASCADE,
  subsection_name_es TEXT DEFAULT 'Rasgos de Carácter',
  subsection_name_en TEXT DEFAULT 'Character Traits',
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- INSERT character_traits (30 черт)
INSERT INTO character_traits (name_es, name_en, code) VALUES
('Honesto', 'Honest', 'honest'),
('Amable', 'Kind', 'kind'),
('Ambicioso', 'Ambitious', 'ambitious'),
('Bromista', 'Humorous', 'humorous'),
('Tranquilo', 'Calm', 'calm'),
('Sensible', 'Sensitive', 'sensitive'),
('Lógico', 'Logical', 'logical'),
('Creativo', 'Creative', 'creative'),
('Sociable', 'Sociable', 'sociable'),
('Introvertido', 'Introverted', 'introverted'),
('Responsable', 'Responsible', 'responsible'),
('Confiable', 'Reliable', 'reliable'),
('Valiente', 'Brave', 'brave'),
('Cauteloso', 'Cautious', 'cautious'),
('Optimista', 'Optimistic', 'optimistic'),
('Pesimista', 'Pessimistic', 'pessimistic'),
('Paciente', 'Patient', 'patient'),
('Impaciente', 'Impatient', 'impatient'),
('Empático', 'Empathetic', 'empathetic'),
('Racional', 'Rational', 'rational'),
('Apasionado', 'Passionate', 'passionate'),
('Reservado', 'Reserved', 'reserved'),
('Espontáneo', 'Spontaneous', 'spontaneous'),
('Metódico', 'Methodical', 'methodical'),
('Modesto', 'Humble', 'humble'),
('Seguro de Sí', 'Self-Confident', 'self_confident'),
('Diplomático', 'Diplomatic', 'diplomatic'),
('Directo', 'Direct', 'direct'),
('Adaptable', 'Adaptable', 'adaptable'),
('Principista', 'Principled', 'principled')
ON CONFLICT DO NOTHING;

-- INSERT profile_character_traits (Voldy's traits)
INSERT INTO profile_character_traits (character_trait_id, section_id, "order") VALUES
(2, 6, 1),   -- Amable
(6, 6, 2),   -- Sensible
(7, 6, 3),   -- Lógico
(15, 6, 4),  -- Optimista
(21, 6, 5)   -- Apasionado
ON CONFLICT DO NOTHING;

-- CREATE INDEXES
CREATE INDEX IF NOT EXISTS idx_profile_character_traits_trait_id ON profile_character_traits(character_trait_id);
CREATE INDEX IF NOT EXISTS idx_profile_character_traits_section_id ON profile_character_traits(section_id);

-- ====================================================================================================
-- МИГРАЦИЯ 5: СТРУКТУРА СТРАСТЕЙ (passions_subsections, passions, profile_passions)
-- ====================================================================================================

-- Создание таблицы passions_subsections
CREATE TABLE IF NOT EXISTS passions_subsections (
  id BIGSERIAL PRIMARY KEY,
  name_es TEXT NOT NULL UNIQUE,
  name_en TEXT NOT NULL UNIQUE,
  code TEXT UNIQUE NOT NULL,
  icon TEXT,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Создание таблицы passions
CREATE TABLE IF NOT EXISTS passions (
  id BIGSERIAL PRIMARY KEY,
  subsection_id BIGINT NOT NULL REFERENCES passions_subsections(id) ON DELETE CASCADE,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Создание таблицы profile_passions (раздел 7)
CREATE TABLE IF NOT EXISTS profile_passions (
  id BIGSERIAL PRIMARY KEY,
  passion_id BIGINT NOT NULL REFERENCES passions(id) ON DELETE CASCADE,
  section_id BIGINT NOT NULL REFERENCES profile_sections(id) ON DELETE CASCADE,
  subsection_name_es TEXT,
  subsection_name_en TEXT,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- INSERT passions_subsections (7 подсекций)
INSERT INTO passions_subsections (name_es, name_en, code, icon, "order") VALUES
('Deporte', 'Sports', 'sports', 'sport', 1),
('Música', 'Music', 'music', 'music', 2),
('Viajes', 'Travel', 'travel', 'plane', 3),
('Arte', 'Art', 'art', 'palette', 4),
('Tecnología', 'Technology', 'technology', 'device-desktop', 5),
('Naturaleza', 'Nature', 'nature', 'tree', 6),
('Culinaria', 'Culinary', 'culinary', 'utensils', 7)
ON CONFLICT DO NOTHING;

-- CREATE INDEXES
CREATE INDEX IF NOT EXISTS idx_passions_subsection_id ON passions(subsection_id);
CREATE INDEX IF NOT EXISTS idx_profile_passions_passion_id ON profile_passions(passion_id);
CREATE INDEX IF NOT EXISTS idx_profile_passions_section_id ON profile_passions(section_id);

-- ====================================================================================================
-- МИГРАЦИЯ 6: ДАННЫЕ СТРАСТЕЙ (INSERT passions и profile_passions)
-- ====================================================================================================

-- INSERT passions (28 страстей по 7 подсекциям)

-- 1. DEPORTE (6)
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(1, 'Fitness en el gimnasio (sin fanatismo)', 'Fitness at the gym (without fanaticism)', 'gym_fitness', 1),
(1, 'Tenis (jugué en el pasado, veo regularmente)', 'Tennis (played in the past, watch regularly)', 'tennis', 2),
(1, 'Bádminton', 'Badminton', 'badminton', 3),
(1, 'Boccia', 'Boccia', 'boccia', 4),
(1, 'Biatlón (veo regularmente)', 'Biathlon (watch regularly)', 'biathlon', 5),
(1, 'Caminatas (camino mucho)', 'Hiking (walk a lot)', 'hiking', 6);

-- 2. MÚSICA (4)
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(2, 'Karaoke', 'Karaoke', 'karaoke', 1),
(2, 'Canto', 'Singing', 'singing', 2),
(2, 'Eurovisión', 'Eurovision', 'eurovision', 3),
(2, 'Música variada', 'Varied music', 'varied_music', 4);

-- 3. VIAJES (6)
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(3, '45+ países visitados', '45+ countries visited', 'countries_visited', 1),
(3, 'Monumentos y atracciones', 'Monuments and attractions', 'attractions', 2),
(3, 'Estambul', 'Istanbul', 'istanbul', 3),
(3, 'España', 'Spain', 'spain', 4),
(3, 'Nuevas culturas', 'New cultures', 'new_cultures', 5),
(3, 'Descubrimientos culinarios', 'Culinary discoveries', 'culinary_discoveries', 6);

-- 4. ARTE (4)
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(4, 'Cinematografía seria', 'Serious cinematography', 'serious_cinema', 1),
(4, 'Premios (Oscar, festivales)', 'Awards (Oscar, festivals)', 'awards', 2),
(4, 'Series juveniles', 'Youth series', 'youth_series', 3),
(4, 'Arquitectura', 'Architecture', 'architecture', 4);

-- 5. TECNOLOGÍA (3)
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(5, 'Inteligencia artificial', 'Artificial intelligence', 'ai', 1),
(5, 'Cosmos (macro y micro)', 'Cosmos (macro and micro)', 'cosmos', 2),
(5, 'Análisis de datos', 'Data analytics', 'data_analytics', 3);

-- 6. NATURALEZA (4)
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(6, 'Senderismo', 'Hiking', 'hiking_nature', 1),
(6, 'Barbacoa', 'Barbecue', 'barbecue', 2),
(6, 'Montañas', 'Mountains', 'mountains', 3),
(6, 'Mar', 'Sea', 'sea', 4);

-- 7. CULINARIA (5)
INSERT INTO passions (subsection_id, name_es, name_en, code, "order") VALUES
(7, 'Me encanta cocinar', 'I love cooking', 'cooking', 1),
(7, 'Me encanta repostería', 'I love baking', 'baking', 2),
(7, 'Mariscos', 'Seafood', 'seafood', 3),
(7, 'Sushi', 'Sushi', 'sushi', 4),
(7, 'Decoración de mesa y recepción de huéspedes', 'Table decoration and hosting guests', 'hosting', 5)
ON CONFLICT DO NOTHING;

-- INSERT profile_passions (32 страсти в профиле)
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
-- DEPORTE (6)
(1, 7, 'Deporte', 'Sports', 1),
(2, 7, 'Deporte', 'Sports', 2),
(3, 7, 'Deporte', 'Sports', 3),
(4, 7, 'Deporte', 'Sports', 4),
(5, 7, 'Deporte', 'Sports', 5),
(6, 7, 'Deporte', 'Sports', 6),
-- MÚSICA (4)
(7, 7, 'Música', 'Music', 7),
(8, 7, 'Música', 'Music', 8),
(9, 7, 'Música', 'Music', 9),
(10, 7, 'Música', 'Music', 10),
-- VIAJES (6)
(11, 7, 'Viajes', 'Travel', 11),
(12, 7, 'Viajes', 'Travel', 12),
(13, 7, 'Viajes', 'Travel', 13),
(14, 7, 'Viajes', 'Travel', 14),
(15, 7, 'Viajes', 'Travel', 15),
(16, 7, 'Viajes', 'Travel', 16),
-- ARTE (4)
(17, 7, 'Arte', 'Art', 17),
(18, 7, 'Arte', 'Art', 18),
(19, 7, 'Arte', 'Art', 19),
(20, 7, 'Arte', 'Art', 20),
-- TECNOLOGÍA (3)
(21, 7, 'Tecnología', 'Technology', 21),
(22, 7, 'Tecnología', 'Technology', 22),
(23, 7, 'Tecnología', 'Technology', 23),
-- NATURALEZA (4)
(24, 7, 'Naturaleza', 'Nature', 24),
(25, 7, 'Naturaleza', 'Nature', 25),
(26, 7, 'Naturaleza', 'Nature', 26),
(27, 7, 'Naturaleza', 'Nature', 27),
-- CULINARIA (5)
(28, 7, 'Culinaria', 'Culinary', 28),
(29, 7, 'Culinaria', 'Culinary', 29),
(30, 7, 'Culinaria', 'Culinary', 30),
(31, 7, 'Culinaria', 'Culinary', 31),
(32, 7, 'Culinaria', 'Culinary', 32)
ON CONFLICT DO NOTHING;

-- ====================================================================================================
-- ФИНАЛЬНАЯ ПРОВЕРКА
-- ====================================================================================================

-- Количество разделов
SELECT COUNT(*) as total_sections FROM profile_sections;

-- Количество языков
SELECT COUNT(*) as total_languages FROM profile_languages;

-- Количество ценностей
SELECT COUNT(*) as total_values FROM profile_values;

-- Количество черт характера
SELECT COUNT(*) as total_traits FROM profile_character_traits;

-- Количество страстей
SELECT COUNT(*) as total_passions FROM profile_passions;

-- Общее количество элементов профиля
SELECT 
  (SELECT COUNT(*) FROM profile_fields) + 
  (SELECT COUNT(*) FROM profile_languages) +
  (SELECT COUNT(*) FROM profile_values) +
  (SELECT COUNT(*) FROM profile_character_traits) +
  (SELECT COUNT(*) FROM profile_passions) as total_profile_items;
