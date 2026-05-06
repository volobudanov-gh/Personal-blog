-- Create character_traits table (reference table for all traits)
CREATE TABLE character_traits (
  id BIGSERIAL PRIMARY KEY,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create profile_character_traits junction table
CREATE TABLE profile_character_traits (
  id BIGSERIAL PRIMARY KEY,
  character_trait_id BIGINT NOT NULL REFERENCES character_traits(id) ON DELETE CASCADE,
  section_id BIGINT NOT NULL REFERENCES profile_sections(id) ON DELETE CASCADE,
  subsection_name_es TEXT DEFAULT 'Rasgos de Carácter',
  subsection_name_en TEXT DEFAULT 'Character Traits',
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Insert character traits data (30 traits)
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
('Principista', 'Principled', 'principled');

-- Insert Voldy's character traits (profile_character_traits)
INSERT INTO profile_character_traits (character_trait_id, section_id, "order") VALUES
(2, 6, 1),   -- Amable
(6, 6, 2),   -- Sensible
(7, 6, 3),   -- Lógico
(15, 6, 4),  -- Optimista
(21, 6, 5);  -- Apasionado

-- Create indexes for better performance
CREATE INDEX idx_profile_character_traits_trait_id ON profile_character_traits(character_trait_id);
CREATE INDEX idx_profile_character_traits_section_id ON profile_character_traits(section_id);

-- Verify
SELECT 
  pct.id,
  ct.name_es,
  ct.name_en,
  pct.subsection_name_es,
  pct."order"
FROM profile_character_traits pct
JOIN character_traits ct ON pct.character_trait_id = ct.id
ORDER BY pct."order";
