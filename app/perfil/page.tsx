export default function Perfil() {
  return (
    <div style={{ maxWidth: '1200px' }}>
      <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '22px' }}>
        Mi Perfil
      </h1>

      <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderTop: '2px solid var(--purple)', borderRadius: '14px', padding: '20px 22px', marginBottom: '16px' }}>
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '15px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '14px' }}>
          Información Básica
        </h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '16px' }}>
          {[
            { label: 'Nombre', value: 'Voldy' },
            { label: 'Edad', value: '25+ años' },
            { label: 'Nacionalidad', value: 'Ucraniana' },
            { label: 'Ciudad', value: '[Tu Ciudad]' },
            { label: 'Idiomas', value: 'Español, Inglés, Ruso' },
            { label: 'Estado', value: 'Buscando pareja' },
          ].map((item) => (
            <div key={item.label}>
              <div style={{ fontSize: '11px', color: 'var(--text-3)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: '4px' }}>
                {item.label}
              </div>
              <div style={{ fontSize: '14px', color: 'var(--text-1)', fontWeight: 500 }}>
                {item.value}
              </div>
            </div>
          ))}
        </div>
      </div>

      <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderTop: '2px solid var(--cyan)', borderRadius: '14px', padding: '20px 22px' }}>
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '15px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '14px' }}>
          Mis Valores
        </h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '12px' }}>
          {['Familia', 'Honestidad', 'Crecimiento', 'Amor', 'Salud', 'Balance'].map((value) => (
            <div
              key={value}
              style={{
                padding: '12px',
                background: 'var(--bg-hover)',
                border: '1px solid var(--border)',
                borderRadius: '8px',
                textAlign: 'center',
                fontSize: '13px',
                color: 'var(--text-2)',
              }}
            >
              {value}
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
