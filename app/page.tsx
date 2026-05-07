export default function Home() {
  return (
    <div style={{ maxWidth: '1200px' }}>
      <div style={{ marginBottom: '22px' }}>
        <div style={{ fontSize: '11px', fontWeight: 600, color: 'var(--purple-lt)', textTransform: 'uppercase', letterSpacing: '0.14em', marginBottom: '6px' }}>
          Bienvenido
        </div>
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', lineHeight: '1.15', marginBottom: '6px' }}>
          Voldy
        </h1>
        <p style={{ fontSize: '14px', color: 'var(--text-2)', lineHeight: '1.55', maxWidth: '780px' }}>
          Hola, soy Voldy. Bienvenido a mi espacio personal donde comparto mis pensamientos, historias y pasiones.
        </p>
      </div>

      {/* KPI Cards */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '14px', marginBottom: '20px' }}>
        {[
          { label: 'Edad', value: '25+' },
          { label: 'Países', value: '45+' },
          { label: 'Publicaciones', value: '7' },
          { label: 'Pasiones', value: '∞' },
        ].map((card) => (
          <div
            key={card.label}
            style={{
              background: 'var(--bg-card)',
              border: '1px solid var(--border)',
              borderTop: '2px solid var(--purple)',
              borderRadius: '14px',
              padding: '18px',
              cursor: 'pointer',
              transition: 'all 0.2s',
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.borderColor = 'var(--border-md)'
              e.currentTarget.style.transform = 'translateY(-1px)'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.borderColor = 'var(--border)'
              e.currentTarget.style.transform = 'translateY(0)'
            }}
          >
            <div style={{ fontSize: '11px', fontWeight: 500, color: 'var(--text-3)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: '8px' }}>
              {card.label}
            </div>
            <div style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', lineHeight: '1' }}>
              {card.value}
            </div>
          </div>
        ))}
      </div>

      {/* Content Card */}
      <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderTop: '2px solid var(--purple)', borderRadius: '14px', padding: '20px 22px', marginBottom: '16px' }}>
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '15px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '4px' }}>
          ¿Quién soy?
        </h2>
        <p style={{ fontSize: '12px', color: 'var(--text-3)', marginBottom: '14px' }}>
          Introducción rápida
        </p>
        <p style={{ fontSize: '14px', color: 'var(--text-2)', lineHeight: '1.6' }}>
          Soy alguien que cree en la profundidad, la honestidad y en construir algo real. Este blog es mi intento de mostrarme tal como soy, sin filtros. Aquí comparto mis reflexiones sobre la vida, mis viajes alrededor del mundo y mi búsqueda de significado.
        </p>
      </div>

      {/* Mis Pasiones */}
      <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderTop: '2px solid var(--cyan)', borderRadius: '14px', padding: '20px 22px', marginBottom: '16px' }}>
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '15px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '4px' }}>
          Mis Pasiones
        </h2>
        <p style={{ fontSize: '12px', color: 'var(--text-3)', marginBottom: '14px' }}>
          Lo que me mueve
        </p>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '12px' }}>
          {['🏋️ Deporte', '🌍 Viajes', '🎬 Cine', '💻 Tecnología', '🍳 Cocina', '📚 Aprender'].map((passion) => (
            <div
              key={passion}
              style={{
                padding: '12px',
                background: 'var(--bg-hover)',
                border: '1px solid var(--border)',
                borderRadius: '8px',
                fontSize: '13px',
                color: 'var(--text-2)',
                textAlign: 'center',
                transition: 'all 0.15s',
                cursor: 'pointer',
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.borderColor = 'var(--purple)'
                e.currentTarget.style.color = 'var(--text-1)'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.borderColor = 'var(--border)'
                e.currentTarget.style.color = 'var(--text-2)'
              }}
            >
              {passion}
            </div>
          ))}
        </div>
      </div>

      {/* Últimos Posts */}
      <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderTop: '2px solid var(--orange)', borderRadius: '14px', padding: '20px 22px' }}>
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '15px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '4px' }}>
          Últimas Publicaciones
        </h2>
        <p style={{ fontSize: '12px', color: 'var(--text-3)', marginBottom: '14px' }}>
          Mis últimos posts
        </p>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
          {[
            { title: 'Hola, soy Voldy', date: '7 mayo 2026' },
            { title: 'Qué busco en una pareja', date: '7 mayo 2026' },
            { title: 'Mis viajes alrededor del mundo', date: '7 mayo 2026' },
          ].map((post) => (
            <div key={post.title} style={{ padding: '12px', background: 'var(--bg-hover)', borderRadius: '8px', border: '1px solid var(--border)', transition: 'all 0.15s', cursor: 'pointer' }} onMouseEnter={(e) => { e.currentTarget.style.borderColor = 'var(--purple)'; e.currentTarget.style.backgroundColor = 'rgba(232, 93, 60, 0.05)' }} onMouseLeave={(e) => { e.currentTarget.style.borderColor = 'var(--border)'; e.currentTarget.style.backgroundColor = 'var(--bg-hover)' }}>
              <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-1)' }}>{post.title}</div>
              <div style={{ fontSize: '11px', color: 'var(--text-3)', marginTop: '4px' }}>{post.date}</div>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
