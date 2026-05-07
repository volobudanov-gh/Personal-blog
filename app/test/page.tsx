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
      <div style={{ maxWidth: '800px', margin: '0 auto', textAlign: 'center' }}>
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '20px' }}>
          Tu Compatibilidad
        </h1>

        <div style={{ fontSize: '48px', fontWeight: 700, color: 'var(--purple)', marginBottom: '20px' }}>
          {compatibility}%
        </div>

        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: '20px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '12px' }}>
          {compatibility >= 75
            ? '¡Somos muy compatibles! 💫'
            : compatibility >= 50
            ? 'Buena compatibilidad 🌟'
            : 'Hay potencial 👀'}
        </h2>

        <button
          onClick={() => {
            setCurrentQuestion(0)
            setScore(0)
            setShowResults(false)
          }}
          style={{
            marginTop: '24px',
            padding: '12px 24px',
            background: 'var(--purple)',
            color: '#fff',
            border: 'none',
            borderRadius: '8px',
            fontSize: '14px',
            fontWeight: 600,
            cursor: 'pointer',
          }}
        >
          Hacer el test de nuevo
        </button>
      </div>
    )
  }

  return (
    <div style={{ maxWidth: '800px', margin: '0 auto' }}>
      <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: '26px', fontWeight: 700, color: 'var(--text-1)', marginBottom: '22px' }}>
        Test de Compatibilidad
      </h1>

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
                textAlign: 'left',
                transition: 'all 0.15s',
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
