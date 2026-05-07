'use client'

import { useState } from 'react'

export default function Test() {
  const [currentQuestion, setCurrentQuestion] = useState(0)
  const [score, setScore] = useState(0)
  const [showResults, setShowResults] = useState(false)

  const questions = [
    {
      question: '¿Cómo te sientes sobre viajar?',
      options: [
        { text: 'Me encanta explorar nuevos lugares', points: 25 },
        { text: 'Me gusta viajar con comodidad', points: 15 },
        { text: 'Prefiero quedarme en casa', points: 5 },
      ],
    },
    {
      question: '¿Qué es más importante en una relación?',
      options: [
        { text: 'Honestidad y profundidad', points: 25 },
        { text: 'Estabilidad y seguridad', points: 15 },
        { text: 'Diversión y entretenimiento', points: 10 },
      ],
    },
    {
      question: '¿Cómo ves tu futuro ideal?',
      options: [
        { text: 'Familia y vida compartida', points: 25 },
        { text: 'Carrera exitosa', points: 15 },
        { text: 'Libertad e independencia', points: 10 },
      ],
    },
  ]

  const handleAnswer = (points: number) => {
    const newScore = score + points
    setScore(newScore)

    if (currentQuestion < questions.length - 1) {
      setCurrentQuestion(currentQuestion + 1)
    } else {
      setShowResults(true)
    }
  }

  const compatibility = Math.min(Math.round((score / 75) * 100), 100)

  if (showResults) {
    return (
      <div style={{ maxWidth: '800px', margin: '0 auto' }}>
        <div style={{ textAlign: 'center', marginBottom: '40px' }}>
          <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '20px' }}>
            Tu Compatibilidad
          </h1>

          <div
            style={{
              width: '200px',
              height: '200px',
              borderRadius: '50%',
              background: `conic-gradient(var(--purple) ${compatibility}%, var(--border) ${compatibility}%)`,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: '0 auto 40px',
              position: 'relative',
            }}
          >
            <div
              style={{
                width: '180px',
                height: '180px',
                borderRadius: '50%',
                background: 'var(--bg-base)',
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                justifyContent: 'center',
              }}
            >
              <div style={{ fontSize: '48px', fontWeight: 700, color: 'var(--purple)' }}>
                {compatibility}%
              </div>
              <div style={{ fontSize: '12px', color: 'var(--text-3)' }}>Compatibilidad</div>
            </div>
          </div>

          <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '20px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '12px' }}>
            {compatibility >= 75
              ? '¡Somos muy compatibles! 💫'
              : compatibility >= 50
              ? 'Buena compatibilidad 🌟'
              : 'Hay potencial 👀'}
          </h2>

          <p style={{ fontSize: '14px', color: 'var(--text-2)', marginBottom: '24px' }}>
            {compatibility >= 75
              ? 'Parece que compartimos valores muy similares. ¡Eso es prometedor!'
              : compatibility >= 50
              ? 'Tenemos bastante en común. Definitivamente hay una base sólida.'
              : 'Nos diferenciamos en algunos aspectos, pero eso no significa que no podamos funcionar.'}
          </p>

          <button
            onClick={() => {
              setCurrentQuestion(0)
              setScore(0)
              setShowResults(false)
            }}
            style={{
              padding: '12px 24px',
              background: 'var(--purple)',
              color: '#fff',
              border: 'none',
              borderRadius: '8px',
              fontSize: '14px',
              fontWeight: 600,
              cursor: 'pointer',
              transition: 'all 0.2s',
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.opacity = '0.9'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.opacity = '1'
            }}
          >
            Hacer el test de nuevo
          </button>
        </div>
      </div>
    )
  }

  return (
    <div style={{ maxWidth: '800px', margin: '0 auto' }}>
      <div style={{ marginBottom: '40px' }}>
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '6px' }}>
          Test de Compatibilidad
        </h1>
        <p style={{ fontSize: '14px', color: 'var(--text-2)' }}>
          Responde estas preguntas para saber qué tan compatibles somos.
        </p>
      </div>

      {/* Progress Bar */}
      <div style={{ marginBottom: '30px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '8px', fontSize: '12px', color: 'var(--text-3)' }}>
          <span>Pregunta {currentQuestion + 1} de {questions.length}</span>
          <span>{Math.round(((currentQuestion + 1) / questions.length) * 100)}%</span>
        </div>
        <div
          style={{
            width: '100%',
            height: '6px',
            background: 'var(--bg-card)',
            borderRadius: '3px',
            overflow: 'hidden',
          }}
        >
          <div
            style={{
              height: '100%',
              background: 'var(--purple)',
              width: `${((currentQuestion + 1) / questions.length) * 100}%`,
              transition: 'width 0.3s ease',
            }}
          />
        </div>
      </div>

      {/* Question */}
      <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderRadius: '14px', padding: '30px', marginBottom: '20px' }}>
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '20px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '20px' }}>
          {questions[currentQuestion].question}
        </h2>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
          {questions[currentQuestion].options.map((option, idx) => (
            <button
              key={idx}
              onClick={() => handleAnswer(option.points)}
              style={{
                padding: '16px',
                background: 'var(--bg-hover)',
                border: '1px solid var(--border)',
                borderRadius: '8px',
                color: 'var(--text-2)',
                fontSize: '14px',
                cursor: 'pointer',
                transition: 'all 0.15s',
                textAlign: 'left',
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.borderColor = 'var(--purple)'
                e.currentTarget.style.backgroundColor = 'rgba(232, 93, 60, 0.1)'
                e.currentTarget.style.color = 'var(--text-1)'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.borderColor = 'var(--border)'
                e.currentTarget.style.backgroundColor = 'var(--bg-hover)'
                e.currentTarget.style.color = 'var(--text-2)'
              }}
            >
              {option.text}
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}
