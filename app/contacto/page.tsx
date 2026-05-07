export default function Contacto() {
  return (
    <div style={{ maxWidth: '1200px' }}>
      <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '22px' }}>
        Contacto
      </h1>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
        <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderRadius: '14px', padding: '20px 22px' }}>
          <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '15px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '16px' }}>
            Envía un mensaje
          </h2>
          <form style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
            <div>
              <label style={{ display: 'block', fontSize: '12px', color: 'var(--text-3)', marginBottom: '6px', textTransform: 'uppercase', letterSpacing: '0.08em' }}>
                Nombre
              </label>
              <input
                type="text"
                placeholder="Tu nombre"
                style={{
                  width: '100%',
                  padding: '10px 12px',
                  background: 'var(--bg-hover)',
                  border: '1px solid var(--border)',
                  borderRadius: '8px',
                  color: 'var(--text-1)',
                  fontSize: '13px',
                }}
              />
            </div>

            <div>
              <label style={{ display: 'block', fontSize: '12px', color: 'var(--text-3)', marginBottom: '6px', textTransform: 'uppercase', letterSpacing: '0.08em' }}>
                Email
              </label>
              <input
                type="email"
                placeholder="tu@email.com"
                style={{
                  width: '100%',
                  padding: '10px 12px',
                  background: 'var(--bg-hover)',
                  border: '1px solid var(--border)',
                  borderRadius: '8px',
                  color: 'var(--text-1)',
                  fontSize: '13px',
                }}
              />
            </div>

            <div>
              <label style={{ display: 'block', fontSize: '12px', color: 'var(--text-3)', marginBottom: '6px', textTransform: 'uppercase', letterSpacing: '0.08em' }}>
                Mensaje
              </label>
              <textarea
                placeholder="Tu mensaje aquí..."
                rows={6}
                style={{
                  width: '100%',
                  padding: '10px 12px',
                  background: 'var(--bg-hover)',
                  border: '1px solid var(--border)',
                  borderRadius: '8px',
                  color: 'var(--text-1)',
                  fontSize: '13px',
                  resize: 'none',
                }}
              />
            </div>

            <button
              type="submit"
              style={{
                padding: '12px',
                background: 'var(--purple)',
                color: '#fff',
                border: 'none',
                borderRadius: '8px',
                fontSize: '13px',
                fontWeight: 600,
                cursor: 'pointer',
              }}
            >
              Enviar Mensaje
            </button>
          </form>
        </div>

        <div>
          <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderTop: '2px solid var(--purple)', borderRadius: '14px', padding: '20px 22px', marginBottom: '16px' }}>
            <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '15px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '4px' }}>
              Email Directo
            </h2>
            <p style={{ fontSize: '12px', color: 'var(--text-3)', marginBottom: '12px' }}>
              Contacta directamente
            </p>
            <a
              href="mailto:tu@email.com"
              style={{
                display: 'inline-block',
                fontSize: '14px',
                color: 'var(--purple)',
                fontWeight: 500,
                textDecoration: 'none',
                borderBottom: '1px solid var(--purple)',
              }}
            >
              tu@email.com
            </a>
          </div>

          <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderTop: '2px solid var(--cyan)', borderRadius: '14px', padding: '20px 22px' }}>
            <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '15px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '4px' }}>
              Ubicación
            </h2>
            <p style={{ fontSize: '12px', color: 'var(--text-3)', marginBottom: '12px' }}>
              Dónde estoy
            </p>
            <p style={{ fontSize: '14px', color: 'var(--text-2)', fontWeight: 500 }}>
              [Tu Ciudad]
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}
