-- Create languages table
CREATE TABLE languages (
  id BIGSERIAL PRIMARY KEY,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create proficiency_levels table
CREATE TABLE proficiency_levels (
  id BIGSERIAL PRIMARY KEY,
  level_key TEXT UNIQUE NOT NULL,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create profile_languages junction table
CREATE TABLE profile_languages (
  id BIGSERIAL PRIMARY KEY,
  language_id BIGINT NOT NULL REFERENCES languages(id) ON DELETE CASCADE,
  proficiency_level_id BIGINT NOT NULL REFERENCES proficiency_levels(id) ON DELETE CASCADE,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Insert languages data
INSERT INTO languages (name_es, name_en, code) VALUES
('Ucraniano', 'Ukrainian', 'uk'),
('Ruso', 'Russian', 'ru'),
('Inglés', 'English', 'en'),
('Español', 'Spanish', 'es'),
('Polaco', 'Polish', 'pl');

-- Insert proficiency levels data
INSERT INTO proficiency_levels (level_key, name_es, name_en, "order") VALUES
('native', 'Nativo', 'Native', 1),
('fluent', 'Fluido', 'Fluent', 2),
('intermediate', 'Intermedio', 'Intermediate', 3),
('basic', 'Básico', 'Basic', 4);

-- Insert profile languages data (Voldy's languages)
INSERT INTO profile_languages (language_id, proficiency_level_id, "order") VALUES
(1, 1, 1),  -- Ucraniano - Nativo
(2, 1, 2),  -- Ruso - Nativo
(3, 2, 3),  -- Inglés - Fluido
(4, 3, 4),  -- Español - Intermedio
(5, 3, 5);  -- Polaco - Intermedio

-- Create indexes for better performance
CREATE INDEX idx_profile_languages_language_id ON profile_languages(language_id);
CREATE INDEX idx_profile_languages_proficiency_level_id ON profile_languages(proficiency_level_id);
