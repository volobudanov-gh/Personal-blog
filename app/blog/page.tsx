export default function Blog() {
  return (
    <div style={{ maxWidth: '1200px' }}>
      <div style={{ marginBottom: '22px' }}>
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '6px' }}>
          Blog
        </h1>
        <p style={{ fontSize: '14px', color: 'var(--text-2)', lineHeight: '1.55' }}>
          Mis reflexiones, historias y pensamientos sobre la vida.
        </p>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '14px' }}>
        {[
          { title: 'Hola, soy Voldy', date: '7 mayo 2026', cat: 'Reflexión' },
          { title: 'Qué busco en una pareja', date: '7 mayo 2026', cat: 'Relaciones' },
          { title: 'Mis viajes alrededor del mundo', date: '7 mayo 2026', cat: 'Viajes' },
          { title: 'Fitness como meditación', date: '7 mayo 2026', cat: 'Estilo de vida' },
          { title: 'Películas que cambiaron mi visión', date: '7 mayo 2026', cat: 'Cine' },
          { title: 'Mis pasiones', date: '7 mayo 2026', cat: 'Intereses' },
        ].map((post) => (
          <div
            key={post.title}
            style={{
              background: 'var(--bg-card)',
              border: '1px solid var(--border)',
              borderRadius: '14px',
              padding: '20px',
              cursor: 'pointer',
              transition: 'all 0.2s',
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.boxShadow = '0 8px 24px rgba(0, 0, 0, 0.2)'
              e.currentTarget.style.transform = 'translateY(-2px)'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.boxShadow = 'none'
              e.currentTarget.style.transform = 'translateY(0)'
            }}
          >
            <div style={{ fontSize: '11px', fontWeight: 600, color: 'var(--purple-lt)', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: '8px' }}>
              {post.cat}
            </div>
            <h3 style={{ fontFamily: "'Syne', sans-serif", fontSize: '16px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '8px' }}>
              {post.title}
            </h3>
            <p style={{ fontSize: '12px', color: 'var(--text-3)' }}>{post.date}</p>
          </div>
        ))}
      </div>
    </div>
  )
}
