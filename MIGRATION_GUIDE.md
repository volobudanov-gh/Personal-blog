# 📋 Руководство по SQL миграциям Personal Blog

## Порядок выполнения миграций

**⚠️ ВАЖНО:** Выполняйте миграции в **правильном порядке**!

### 1️⃣ Первая миграция: Создание базовых таблиц профиля
**Файл:** `20260506000001_create_profile_tables.sql`

Создаёт:
- `profile_sections` (6-7 разделов)
- `profile_fields` (20 полей)

**Статус:** ✅ Уже запущена

---

### 2️⃣ Вторая миграция: Создание таблиц языков
**Файл:** `20260506000002_create_languages_tables.sql`

Создаёт:
- `languages` (5 языков)
- `proficiency_levels` (4 уровня владения)
- `profile_languages` (связь профиля с языками)

**Выполнить в Supabase:**
```sql
-- Скопируйте весь код из файла 20260506000002_create_languages_tables.sql
```

---

### 3️⃣ Третья миграция: Создание таблиц ценностей
**Файл:** `20260506000005_create_values_tables.sql`

Создаёт:
- `values` (30 ценностей)
- `profile_values` (связь профиля с ценностями)

**Выполнить в Supabase:**
```sql
-- Скопируйте весь код из файла 20260506000005_create_values_tables.sql
```

---

### 4️⃣ Четвёртая миграция: Создание таблиц черт характера
**Файл:** `20260506000006_create_character_traits_tables.sql`

Создаёт:
- `character_traits` (30 черт)
- `profile_character_traits` (связь профиля с чертами)

**Выполнить в Supabase:**
```sql
-- Скопируйте весь код из файла 20260506000006_create_character_traits_tables.sql
```

---

### 5️⃣ Пятая миграция: Создание структуры страстей (часть 1)
**Файл:** `20260506000007_create_passions_tables.sql`

Создаёт:
- `passions_subsections` (7 подсекций)
- `passions` (пусто - данные далее)
- `profile_passions` (пусто - данные далее)

**Выполнить в Supabase:**
```sql
-- Скопируйте весь код из файла 20260506000007_create_passions_tables.sql
```

---

### 6️⃣ Шестая миграция: Заполнение данных страстей (часть 2)
**Файл:** `20260506000008_insert_passions_data.sql`

Вставляет:
- 28 страстей в таблицу `passions` по 7 подсекциям
- Все 32 строки в таблицу `profile_passions` (связь с профилем)

**ВАЖНО:** Выполняйте **ТОЛЬКО ПОСЛЕ** миграции 7!

**Порядок выполнения в Supabase:**

**Шаг 1:** Вставить все страсти в таблицу `passions`
```sql
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
```

**Шаг 2:** Вставить все страсти в таблицу `profile_passions` (связь с профилем)
```sql
INSERT INTO profile_passions (passion_id, section_id, subsection_name_es, subsection_name_en, "order") VALUES
-- DEPORTE (Sports)
(1, 14, 'Deporte', 'Sports', 1),
(2, 14, 'Deporte', 'Sports', 2),
(3, 14, 'Deporte', 'Sports', 3),
(4, 14, 'Deporte', 'Sports', 4),
(5, 14, 'Deporte', 'Sports', 5),
(6, 14, 'Deporte', 'Sports', 6),
-- MÚSICA (Music)
(7, 14, 'Música', 'Music', 7),
(8, 14, 'Música', 'Music', 8),
(9, 14, 'Música', 'Music', 9),
(10, 14, 'Música', 'Music', 10),
-- VIAJES (Travel)
(11, 14, 'Viajes', 'Travel', 11),
(12, 14, 'Viajes', 'Travel', 12),
(13, 14, 'Viajes', 'Travel', 13),
(14, 14, 'Viajes', 'Travel', 14),
(15, 14, 'Viajes', 'Travel', 15),
(16, 14, 'Viajes', 'Travel', 16),
-- ARTE (Art)
(17, 14, 'Arte', 'Art', 17),
(18, 14, 'Arte', 'Art', 18),
(19, 14, 'Arte', 'Art', 19),
(20, 14, 'Arte', 'Art', 20),
-- TECNOLOGÍA (Technology)
(21, 14, 'Tecnología', 'Technology', 21),
(22, 14, 'Tecnología', 'Technology', 22),
(23, 14, 'Tecnología', 'Technology', 23),
-- NATURALEZA (Nature)
(24, 14, 'Naturaleza', 'Nature', 24),
(25, 14, 'Naturaleza', 'Nature', 25),
(26, 14, 'Naturaleza', 'Nature', 26),
(27, 14, 'Naturaleza', 'Nature', 27),
-- CULINARIA (Culinary)
(28, 14, 'Culinaria', 'Culinary', 28),
(29, 14, 'Culinaria', 'Culinary', 29),
(30, 14, 'Culinaria', 'Culinary', 30),
(31, 14, 'Culinaria', 'Culinary', 31),
(32, 14, 'Culinaria', 'Culinary', 32);
```

**Шаг 3:** Проверить результаты
```sql
SELECT 
  pp.id,
  pp.subsection_name_es,
  p.name_es,
  pp."order"
FROM profile_passions pp
JOIN passions p ON pp.passion_id = p.id
ORDER BY pp."order";
```

---

## 📊 Структура БД после всех миграций

```
PROFILE SECTIONS (7):
├── 1. Información Básica
├── 2. Características Físicas
├── 3. Astrología
├── 4. Estilo de Vida
├── 5. Educación y Profesión
│   ├── Fields: educacion, profesion, licencia_conducir
│   └── Subsection: Idiomas (5 languages)
├── 6. Personalidad
│   ├── Field: tipo_personalidad
│   ├── Subsection: Valores (5 selected)
│   └── Subsection: Rasgos de Carácter (5 selected)
└── 7. Mis Pasiones
    ├── Deporte (6)
    ├── Música (4)
    ├── Viajes (6)
    ├── Arte (4)
    ├── Tecnología (3)
    ├── Naturaleza (4)
    └── Culinaria (5)
```

---

## ✅ Контрольный список

- [ ] Миграция 1: `profile_sections` и `profile_fields` ✅ (уже в GitHub)
- [ ] Миграция 2: `languages`, `proficiency_levels`, `profile_languages`
- [ ] Миграция 3: `values`, `profile_values`
- [ ] Миграция 4: `character_traits`, `profile_character_traits`
- [ ] Миграция 5: `passions_subsections`, `passions`, `profile_passions`
- [ ] Миграция 6: Data INSERT для `passions` и `profile_passions`
- [ ] Проверка всех данных в Supabase Dashboard

---

## 🚀 Как загрузить в GitHub

1. **Скопируйте все SQL файлы в папку:**
   ```
   supabase/migrations/
   ├── 20260506000001_create_profile_tables.sql
   ├── 20260506000002_create_languages_tables.sql
   ├── 20260506000003_restructure_profile_sections_fixed.sql (архивный)
   ├── 20260506000004_add_section_id_to_profile_languages.sql (архивный)
   ├── 20260506000005_create_values_tables.sql
   ├── 20260506000006_create_character_traits_tables.sql
   ├── 20260506000007_create_passions_tables.sql
   └── 20260506000008_insert_passions_data.sql
   ```

2. **Commit в Git:**
   ```bash
   git add supabase/migrations/
   git commit -m "feat: Add complete profile structure with languages, values, traits, and passions"
   git push origin main
   ```

3. **Обновите ARCHITECTURE.md также**

---

**Дата создания:** 6 мая 2026  
**Версия:** 1.0  
**Статус:** Готово для загрузки в GitHub
