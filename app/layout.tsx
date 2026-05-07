'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const [theme, setTheme] = useState('dark')
  const [themeMenuOpen, setThemeMenuOpen] = useState(false)
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    setMounted(true)
    const savedTheme = localStorage.getItem('theme') || 'dark'
    setTheme(savedTheme)
    document.documentElement.setAttribute('data-theme', savedTheme)
  }, [])

  const handleThemeChange = (newTheme: string) => {
    setTheme(newTheme)
    localStorage.setItem('theme', newTheme)
    document.documentElement.setAttribute('data-theme', newTheme)
    setThemeMenuOpen(false)
  }

  const themes = [
    { id: 'dark', name: 'Oscuro', preview: '#0A0F1C' },
    { id: 'light', name: 'Claro', preview: '#FBF7EE' },
    { id: 'mediterraneo', name: 'Mediterráneo', preview: '#FEF9F0' },
    { id: 'azulejo', name: 'Azulejo', preview: '#0C1F3A' },
  ]

  const navItems = [
    { label: 'Inicio', href: '/', icon: '🏠' },
    { label: 'Perfil', href: '/perfil', icon: '👤' },
    { label: 'Blog', href: '/blog', icon: '📝' },
    { label: 'Test', href: '/test', icon: '🧪' },
    { label: 'Contacto', href: '/contacto', icon: '✉️' },
  ]

  if (!mounted) return null

  return (
    <html lang="es" data-theme={theme}>
      <head>
        <meta charSet="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Voldy · Blog Personal</title>
        <link
          href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500;600&display=swap"
          rel="stylesheet"
        />
        <style>{`
          :root {
            --bg-base: #0A0F1C;
            --bg-panel: #111829;
            --bg-card: #171F33;
            --bg-hover: #1E2640;
            --purple: #E85D3C;
            --purple-lt: #F27B5C;
            --purple-dim: rgba(232, 93, 60, 0.15);
            --cyan: #E9B949;
            --cyan-dim: rgba(233, 185, 73, 0.12);
            --orange: #F59E0B;
            --orange-dim: rgba(245, 158, 11, 0.12);
            --red: #EF4444;
            --green: #4ADE80;
            --green-dim: rgba(74, 222, 128, 0.12);
            --text-1: #F5F2EC;
            --text-2: #A8A496;
            --text-3: #5D5A4D;
            --border: rgba(255, 255, 255, 0.06);
            --border-md: rgba(255, 255, 255, 0.10);
            --sidebar-w: 250px;
            --topbar-h: 64px;
            --topbar-bg: rgba(10, 15, 28, 0.92);
          }

          [data-theme="light"] {
            --bg-base: #FBF7EE;
            --bg-panel: #FFFFFF;
            --bg-card: #FFFFFF;
            --bg-hover: #F4EEE0;
            --purple: #C0392B;
            --purple-lt: #E85D3C;
            --purple-dim: rgba(192, 57, 43, 0.10);
            --cyan: #B8860B;
            --cyan-dim: rgba(184, 134, 11, 0.10);
            --orange: #D97706;
            --orange-dim: rgba(217, 119, 6, 0.10);
            --red: #DC2626;
            --green: #16A34A;
            --green-dim: rgba(22, 163, 74, 0.10);
            --text-1: #2A2418;
            --text-2: #5A5444;
            --text-3: #96917F;
            --border: rgba(0, 0, 0, 0.07);
            --border-md: rgba(0, 0, 0, 0.12);
            --topbar-bg: rgba(251, 247, 238, 0.95);
          }

          [data-theme="mediterraneo"] {
            --bg-base: #FEF9F0;
            --bg-panel: #FFFFFF;
            --bg-card: #FFFAF0;
            --bg-hover: #FCEED7;
            --purple: #D35400;
            --purple-lt: #E67E22;
            --purple-dim: rgba(211, 84, 0, 0.10);
            --cyan: #1ABC9C;
            --cyan-dim: rgba(26, 188, 156, 0.10);
            --orange: #F39C12;
            --orange-dim: rgba(243, 156, 18, 0.10);
            --red: #C0392B;
            --green: #27AE60;
            --green-dim: rgba(39, 174, 96, 0.10);
            --text-1: #2C3E50;
            --text-2: #5D6D7E;
            --text-3: #95A5A6;
            --border: rgba(0, 0, 0, 0.07);
            --border-md: rgba(0, 0, 0, 0.12);
            --topbar-bg: rgba(254, 249, 240, 0.95);
          }

          [data-theme="azulejo"] {
            --bg-base: #0C1F3A;
            --bg-panel: #132A4D;
            --bg-card: #1A3360;
            --bg-hover: #213D72;
            --purple: #F4A261;
            --purple-lt: #F6B88B;
            --purple-dim: rgba(244, 162, 97, 0.15);
            --cyan: #2A9D8F;
            --cyan-dim: rgba(42, 157, 143, 0.12);
            --orange: #E9C46A;
            --orange-dim: rgba(233, 196, 106, 0.12);
            --red: #E76F51;
            --green: #52B788;
            --green-dim: rgba(82, 183, 136, 0.12);
            --text-1: #F1E9D9;
            --text-2: #B5C3D3;
            --text-3: #6A7C92;
            --border: rgba(255, 255, 255, 0.07);
            --border-md: rgba(255, 255, 255, 0.12);
            --topbar-bg: rgba(12, 31, 58, 0.95);
          }

          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }

          html, body {
            width: 100%;
            height: 100%;
          }

          body {
            font-family: 'DM Sans', sans-serif;
            background: var(--bg-base);
            color: var(--text-1);
            min-height: 100vh;
            overflow-x: hidden;
            transition: background-color 0.3s, color 0.3s;
          }

          a {
            text-decoration: none;
            color: inherit;
          }

          .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: var(--sidebar-w);
            height: 100vh;
            background: var(--bg-panel);
            border-right: 1px solid var(--border);
            display: flex;
            flex-direction: column;
            z-index: 100;
          }

          .sidebar-logo {
            padding: 18px 18px 14px;
            border-bottom: 1px solid var(--border);
            display: flex;
            flex-direction: column;
            gap: 10px;
          }

          .logo-row {
            display: flex;
            align-items: center;
            gap: 10px;
          }

          .logo-mark {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            background: linear-gradient(135deg, var(--purple), #A93226);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Syne', sans-serif;
            font-weight: 800;
            font-size: 18px;
            color: #fff;
            flex-shrink: 0;
            position: relative;
            overflow: hidden;
          }

          .logo-mark::after {
            content: '';
            position: absolute;
            bottom: -4px;
            right: -4px;
            width: 14px;
            height: 14px;
            background: var(--cyan);
            border-radius: 50%;
            border: 2px solid var(--bg-panel);
          }

          .logo-text {
            display: flex;
            flex-direction: column;
            line-height: 1;
          }

          .logo-title {
            font-family: 'Syne', sans-serif;
            font-weight: 700;
            font-size: 16px;
            color: var(--text-1);
            letter-spacing: -0.01em;
          }

          .logo-sub {
            font-size: 9px;
            color: var(--text-3);
            text-transform: uppercase;
            letter-spacing: 0.15em;
            margin-top: 3px;
          }

          .sidebar-nav {
            flex: 1;
            padding: 14px 10px;
            display: flex;
            flex-direction: column;
            gap: 1px;
            overflow-y: auto;
          }

          .nav-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 9px 10px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.15s;
            color: var(--text-2);
            font-size: 13px;
            position: relative;
            user-select: none;
          }

          .nav-item:hover {
            background: var(--bg-hover);
            color: var(--text-1);
          }

          .nav-item.active {
            background: var(--purple-dim);
            color: var(--text-1);
          }

          .nav-item.active::before {
            content: '';
            position: absolute;
            left: -10px;
            top: 50%;
            transform: translateY(-50%);
            width: 3px;
            height: 18px;
            background: var(--purple-lt);
            border-radius: 0 3px 3px 0;
          }

          .sidebar-footer {
            padding: 14px 12px;
            border-top: 1px solid var(--border);
          }

          .topbar {
            position: fixed;
            top: 0;
            left: var(--sidebar-w);
            right: 0;
            height: var(--topbar-h);
            background: var(--topbar-bg);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border);
            display: flex;
            align-items: center;
            padding: 0 26px;
            gap: 16px;
            z-index: 90;
          }

          .topbar-breadcrumb {
            flex: 1;
            display: flex;
            align-items: center;
            gap: 8px;
          }

          .breadcrumb-root {
            font-family: 'Syne', sans-serif;
            font-size: 16px;
            font-weight: 700;
            color: var(--text-1);
          }

          .breadcrumb-sep {
            color: var(--text-3);
          }

          .breadcrumb-page {
            font-size: 13px;
            color: var(--text-2);
          }

          .topbar-controls {
            display: flex;
            align-items: center;
            gap: 10px;
            position: relative;
          }

          .topbar-btn {
            width: 34px;
            height: 34px;
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.15s;
            color: var(--text-2);
            font-size: 16px;
            padding: 0;
          }

          .topbar-btn:hover {
            border-color: var(--border-md);
            background: var(--bg-hover);
            color: var(--text-1);
          }

          .theme-picker {
            position: relative;
          }

          .theme-panel {
            position: absolute;
            top: calc(100% + 8px);
            right: 0;
            background: var(--bg-panel);
            border: 1px solid var(--border-md);
            border-radius: 12px;
            padding: 12px;
            width: 240px;
            z-index: 200;
            display: none;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.35);
          }

          .theme-panel.open {
            display: block;
            animation: slideDown 0.2s ease-out;
          }

          @keyframes slideDown {
            from {
              opacity: 0;
              transform: translateY(-4px);
            }
            to {
              opacity: 1;
              transform: translateY(0);
            }
          }

          .theme-panel-title {
            font-size: 10px;
            font-weight: 600;
            color: var(--text-3);
            text-transform: uppercase;
            letter-spacing: 0.1em;
            margin-bottom: 10px;
          }

          .theme-options {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 6px;
          }

          .theme-option {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 5px;
            padding: 8px 4px;
            border-radius: 8px;
            cursor: pointer;
            border: 1px solid transparent;
            transition: all 0.15s;
            background: none;
            font-family: inherit;
          }

          .theme-option:hover {
            background: var(--bg-hover);
          }

          .theme-option.active {
            border-color: var(--purple);
          }

          .theme-swatch {
            width: 36px;
            height: 36px;
            border-radius: 6px;
            border: 1px solid rgba(255, 255, 255, 0.12);
          }

          .theme-label {
            font-size: 11px;
            color: var(--text-2);
          }

          .theme-option.active .theme-label {
            color: var(--text-1);
            font-weight: 600;
          }

          .main {
            margin-left: var(--sidebar-w);
            margin-top: var(--topbar-h);
            padding: 26px 28px;
            min-height: calc(100vh - var(--topbar-h));
            overflow-y: auto;
          }

          @media (max-width: 900px) {
            .sidebar {
              transform: translateX(-100%);
              transition: transform 0.26s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .topbar {
              left: 0;
            }

            .main {
              margin-left: 0;
            }
          }
        `}</style>
      </head>
      <body>
        <aside className="sidebar">
          <div className="sidebar-logo">
            <div className="logo-row">
              <div className="logo-mark">V</div>
              <div className="logo-text">
                <div className="logo-title">Voldy</div>
                <div className="logo-sub">Blog Personal</div>
              </div>
            </div>
          </div>

          <nav className="sidebar-nav">
            {navItems.map((item) => (
              <Link key={item.href} href={item.href} className="nav-item active">
                <span>{item.icon}</span>
                <span>{item.label}</span>
              </Link>
            ))}
          </nav>

          <div className="sidebar-footer">
            <button
              onClick={() => setThemeMenuOpen(!themeMenuOpen)}
              style={{
                width: '100%',
                padding: '8px 12px',
                background: 'var(--bg-card)',
                border: '1px solid var(--border)',
                borderRadius: '8px',
                color: 'var(--text-2)',
                cursor: 'pointer',
                fontSize: '12px',
                fontFamily: "'DM Sans', sans-serif",
                transition: 'all 0.15s',
              }}
            >
              🎨 Temas
            </button>
          </div>
        </aside>

        <header className="topbar">
          <div className="topbar-breadcrumb">
            <span className="breadcrumb-root">Voldy</span>
            <span className="breadcrumb-sep">›</span>
            <span className="breadcrumb-page">Inicio</span>
          </div>
          <div className="topbar-controls">
            <div className="theme-picker">
              <button className="topbar-btn" onClick={() => setThemeMenuOpen(!themeMenuOpen)}>
                🎨
              </button>
              {themeMenuOpen && (
                <div className="theme-panel open">
                  <div className="theme-panel-title">Temas</div>
                  <div className="theme-options">
                    {themes.map((t) => (
                      <button
                        key={t.id}
                        className={`theme-option ${theme === t.id ? 'active' : ''}`}
                        onClick={() => handleThemeChange(t.id)}
                      >
                        <div className="theme-swatch" style={{ background: t.preview }} />
                        <div className="theme-label">{t.name}</div>
                      </button>
                    ))}
                  </div>
                </div>
              )}
            </div>
          </div>
        </header>

        <main className="main">{children}</main>
      </body>
    </html>
  )
}
