-- Create values table (reference table for all values)
CREATE TABLE values (
  id BIGSERIAL PRIMARY KEY,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create profile_values junction table
CREATE TABLE profile_values (
  id BIGSERIAL PRIMARY KEY,
  value_id BIGINT NOT NULL REFERENCES values(id) ON DELETE CASCADE,
  section_id BIGINT NOT NULL REFERENCES profile_sections(id) ON DELETE CASCADE,
  subsection_name_es TEXT DEFAULT 'Valores',
  subsection_name_en TEXT DEFAULT 'Values',
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Insert values data (30 values)
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
('Fidelidad a Uno Mismo', 'Loyalty to Oneself', 'loyalty_to_oneself');

-- Insert Voldy's values (profile_values)
INSERT INTO profile_values (value_id, section_id, "order") VALUES
(2, 6, 1),   -- Familia
(5, 6, 2),   -- Confianza
(12, 6, 3),  -- Autodesarrollo
(15, 6, 4),  -- Salud
(26, 6, 5);  -- Balance de Vida

-- Create indexes for better performance
CREATE INDEX idx_profile_values_value_id ON profile_values(value_id);
CREATE INDEX idx_profile_values_section_id ON profile_values(section_id);

-- Verify
SELECT 
  pv.id,
  v.name_es,
  v.name_en,
  pv.subsection_name_es,
  pv."order"
FROM profile_values pv
JOIN values v ON pv.value_id = v.id
ORDER BY pv."order";
