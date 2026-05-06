-- Create profile_sections table
create table if not exists profile_sections (
  id bigserial primary key,
  section_name_es text not null,
  section_name_en text not null,
  "order" integer not null,
  icon text,
  created_at timestamp with time zone default now()
);

-- Create profile_fields table
create table if not exists profile_fields (
  id bigserial primary key,
  field_name text not null unique,
  label_es text not null,
  label_en text not null,
  section_id bigint not null references profile_sections(id) on delete cascade,
  data_type text,
  value text,
  "order" integer,
  created_at timestamp with time zone default now()
);

-- Insert profile sections data
insert into profile_sections (section_name_es, section_name_en, "order", icon) 
values
  ('Información Básica', 'Basic Information', 1, 'info'),
  ('Características Físicas', 'Physical Characteristics', 2, 'body'),
  ('Astrología', 'Astrology', 3, 'star'),
  ('Estilo de Vida', 'Lifestyle', 4, 'home'),
  ('Personalidad y Educación', 'Personality & Education', 5, 'book')
on conflict do nothing;

-- Insert profile fields data
insert into profile_fields (field_name, label_es, label_en, section_id, data_type, value, "order") 
values
  ('nombre', 'Nombre', 'Name', 1, 'text', 'Voldy', 1),
  ('edad', 'Edad', 'Age', 1, 'integer', '38', 2),
  ('nacionalidad', 'Nacionalidad', 'Nationality', 1, 'text', 'Ucraniano', 3),
  ('ciudad', 'Ciudad', 'City', 1, 'text', 'Valencia', 4),
  ('profesion', 'Profesión', 'Profession', 1, 'text', 'Autónomo en Tecnología de la Información', 5),
  ('altura', 'Altura', 'Height', 2, 'integer', '182', 1),
  ('peso', 'Peso', 'Weight', 2, 'integer', '74', 2),
  ('tipo_cuerpo', 'Tipo de cuerpo', 'Body type', 2, 'text', 'Delgado pero tonificado', 3),
  ('color_ojos', 'Color de ojos', 'Eye color', 2, 'text', 'Azul', 4),
  ('cabello', 'Cabello', 'Hair', 2, 'text', 'Cabeza rapada', 5),
  ('signo_zodiaco_mes', 'Signo Zodiacal (Mes)', 'Zodiac Sign (Month)', 3, 'text', 'Cáncer', 1),
  ('signo_zodiaco_chino', 'Signo Zodiacal (Chino)', 'Zodiac Sign (Chinese)', 3, 'text', 'Dragón', 2),
  ('fumar', 'Fumar', 'Smoking', 4, 'text', 'No', 1),
  ('alcohol', 'Alcohol', 'Alcohol', 4, 'text', 'A veces', 2),
  ('estado_civil', 'Estado Civil', 'Marital Status', 4, 'text', 'Soltero', 3),
  ('situacion_vivienda', 'Situación de Vivienda', 'Living Situation', 4, 'text', 'Vivo solo', 4),
  ('licencia_conducir', 'Licencia de Conducir', 'Driver License', 4, 'boolean', 'true', 5),
  ('experiencia_relaciones_pasadas', 'Experiencia en Relaciones Pasadas', 'Past Relationship Experience', 4, 'text', '11 años', 6),
  ('tipo_personalidad', 'Tipo de Personalidad', 'Personality Type', 5, 'text', 'Equilibrado entre introversión y extroversión', 1),
  ('educacion', 'Educación', 'Education', 5, 'text', 'Máster', 2)
on conflict do nothing;
