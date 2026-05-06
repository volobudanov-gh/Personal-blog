-- Create passions_subsections table (7 subsections)
CREATE TABLE passions_subsections (
  id BIGSERIAL PRIMARY KEY,
  name_es TEXT NOT NULL UNIQUE,
  name_en TEXT NOT NULL UNIQUE,
  code TEXT UNIQUE NOT NULL,
  icon TEXT,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create passions table (individual passions in each subsection)
CREATE TABLE passions (
  id BIGSERIAL PRIMARY KEY,
  subsection_id BIGINT NOT NULL REFERENCES passions_subsections(id) ON DELETE CASCADE,
  name_es TEXT NOT NULL,
  name_en TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create profile_passions junction table (Voldy's selected passions)
CREATE TABLE profile_passions (
  id BIGSERIAL PRIMARY KEY,
  passion_id BIGINT NOT NULL REFERENCES passions(id) ON DELETE CASCADE,
  section_id BIGINT NOT NULL REFERENCES profile_sections(id) ON DELETE CASCADE,
  subsection_name_es TEXT,  -- Will be populated from passions_subsections.name_es
  subsection_name_en TEXT,  -- Will be populated from passions_subsections.name_en
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Insert 7 passions subsections
INSERT INTO passions_subsections (name_es, name_en, code, icon, "order") VALUES
('Deporte', 'Sports', 'sports', 'sport', 1),
('Música', 'Music', 'music', 'music', 2),
('Viajes', 'Travel', 'travel', 'plane', 3),
('Arte', 'Art', 'art', 'palette', 4),
('Tecnología', 'Technology', 'technology', 'device-desktop', 5),
('Naturaleza', 'Nature', 'nature', 'tree', 6),
('Culinaria', 'Culinary', 'culinary', 'utensils', 7);

-- Create indexes for better performance
CREATE INDEX idx_passions_subsection_id ON passions(subsection_id);
CREATE INDEX idx_profile_passions_passion_id ON profile_passions(passion_id);
CREATE INDEX idx_profile_passions_section_id ON profile_passions(section_id);

-- Verify subsections created
SELECT 
  id,
  name_es,
  name_en,
  code,
  "order"
FROM passions_subsections
ORDER BY "order";
