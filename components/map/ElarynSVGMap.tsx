'use client'

// The continent of Elaryn — a full SVG fantasy map
// Coordinate system: 0,0 top-left, 1000x700 viewport
// All town coordinates match the database map_x / map_y values

export default function ElarynSVGMap() {
  return (
    <svg
      viewBox="0 0 1000 700"
      xmlns="http://www.w3.org/2000/svg"
      style={{ width: '100%', height: '100%' }}
    >
      <defs>
        {/* ── Parchment texture ── */}
        <filter id="parchment" x="-5%" y="-5%" width="110%" height="110%">
          <feTurbulence type="fractalNoise" baseFrequency="0.65" numOctaves="3" stitchTiles="stitch" result="noise" />
          <feColorMatrix type="saturate" values="0" in="noise" result="grayNoise" />
          <feBlend in="SourceGraphic" in2="grayNoise" mode="multiply" result="blended" />
          <feComponentTransfer in="blended">
            <feFuncR type="linear" slope="0.9" intercept="0.05" />
            <feFuncG type="linear" slope="0.85" intercept="0.04" />
            <feFuncB type="linear" slope="0.7" intercept="0.02" />
          </feComponentTransfer>
        </filter>

        {/* ── Hand-drawn wobble on coastlines ── */}
        <filter id="wobble" x="-2%" y="-2%" width="104%" height="104%">
          <feTurbulence type="turbulence" baseFrequency="0.015" numOctaves="4" seed="8" result="turbulence" />
          <feDisplacementMap in="SourceGraphic" in2="turbulence" scale="4" xChannelSelector="R" yChannelSelector="G" />
        </filter>

        {/* ── Soft shadow for regions ── */}
        <filter id="shadow" x="-10%" y="-10%" width="120%" height="120%">
          <feDropShadow dx="2" dy="3" stdDeviation="4" floodColor="#3d2b1f" floodOpacity="0.4" />
        </filter>

        {/* ── Vignette for map edges ── */}
        <radialGradient id="vignette" cx="50%" cy="50%" r="70%">
          <stop offset="60%" stopColor="transparent" />
          <stop offset="100%" stopColor="#1a0e05" stopOpacity="0.7" />
        </radialGradient>

        {/* ── Ocean gradient ── */}
        <radialGradient id="oceanGrad" cx="30%" cy="40%" r="80%">
          <stop offset="0%" stopColor="#2a4a6b" />
          <stop offset="100%" stopColor="#0d1f30" />
        </radialGradient>

        {/* ── Region fill gradients ── */}
        <linearGradient id="hearthGrad" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#c8b887" />
          <stop offset="100%" stopColor="#b8a070" />
        </linearGradient>
        <linearGradient id="ashGrad" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#7a6a5a" />
          <stop offset="100%" stopColor="#5a4a3a" />
        </linearGradient>
        <linearGradient id="verdantGrad" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#4a7a4a" />
          <stop offset="100%" stopColor="#2a5a2a" />
        </linearGradient>
        <linearGradient id="frostGrad" x1="0%" y1="100%" x2="100%" y2="0%">
          <stop offset="0%" stopColor="#b0c8d8" />
          <stop offset="100%" stopColor="#d8eaf5" />
        </linearGradient>
        <linearGradient id="amberGrad" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#c89a3a" />
          <stop offset="100%" stopColor="#a07828" />
        </linearGradient>
        <linearGradient id="saltGrad" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#4a7a8a" />
          <stop offset="100%" stopColor="#2a5a6a" />
        </linearGradient>

        {/* ── Parchment base ── */}
        <linearGradient id="parchBase" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#f0e8cc" />
          <stop offset="50%" stopColor="#e8d8b0" />
          <stop offset="100%" stopColor="#d8c898" />
        </linearGradient>
      </defs>

      {/* ── Ocean / parchment base ── */}
      <rect width="1000" height="700" fill="url(#parchBase)" />
      <rect width="1000" height="700" fill="url(#parchment)" opacity="0.6" />

      {/* ── Ocean areas ── */}
      <g filter="url(#wobble)">
        {/* Western sea */}
        <path d="M0,0 L130,0 L120,200 L80,350 L0,380 Z" fill="url(#oceanGrad)" opacity="0.85" />
        {/* Southern sea */}
        <path d="M0,620 L300,650 L500,670 L700,660 L1000,680 L1000,700 L0,700 Z" fill="url(#oceanGrad)" opacity="0.85" />
        {/* Far east */}
        <path d="M920,0 L1000,0 L1000,700 L940,680 L960,400 L920,200 Z" fill="url(#oceanGrad)" opacity="0.75" />
      </g>

      {/* ── CONTINENT SHAPE ── */}
      <g filter="url(#shadow)">
        <path
          d="
            M140,50 L200,30 L320,20 L480,15 L620,25 L780,40 L880,60 L920,120
            L910,200 L930,280 L910,360 L880,430 L860,500 L820,560 L760,610
            L680,640 L580,650 L480,645 L380,640 L300,630 L220,610 L160,580
            L120,530 L100,460 L90,380 L95,290 L110,200 L130,120 Z
          "
          fill="url(#parchBase)"
          stroke="#8b6914"
          strokeWidth="2.5"
          filter="url(#wobble)"
        />
      </g>

      {/* ── REGIONS ── */}

      {/* Frostmarch — north */}
      <path
        d="M200,25 L600,18 L880,60 L920,120 L910,200 L760,190 L620,180 L480,185 L340,190 L200,195 L140,140 L140,70 Z"
        fill="url(#frostGrad)"
        opacity="0.75"
        filter="url(#wobble)"
      />

      {/* Verdant Reach — west */}
      <path
        d="M100,200 L340,190 L360,280 L340,400 L300,480 L240,520 L180,530 L130,500 L95,430 L90,330 Z"
        fill="url(#verdantGrad)"
        opacity="0.7"
        filter="url(#wobble)"
      />

      {/* Hearthlands — centre */}
      <path
        d="M340,190 L760,190 L800,280 L790,400 L760,480 L680,520 L560,530 L440,525 L340,510 L300,480 L340,400 L360,280 Z"
        fill="url(#hearthGrad)"
        opacity="0.7"
        filter="url(#wobble)"
      />

      {/* Ashfields — east */}
      <path
        d="M760,190 L910,200 L930,280 L910,360 L880,430 L880,520 L840,580 L760,610 L680,560 L680,480 L760,480 L800,400 L790,280 Z"
        fill="url(#ashGrad)"
        opacity="0.7"
        filter="url(#wobble)"
      />

      {/* Amber Expanse — south-east */}
      <path
        d="M560,530 L760,480 L780,560 L760,610 L680,640 L580,650 L480,645 L440,600 L440,525 Z"
        fill="url(#amberGrad)"
        opacity="0.7"
        filter="url(#wobble)"
      />

      {/* Saltmere Coast — south-west */}
      <path
        d="M130,500 L240,520 L300,480 L340,510 L440,525 L440,600 L380,640 L300,630 L220,610 L160,580 L120,530 Z"
        fill="url(#saltGrad)"
        opacity="0.65"
        filter="url(#wobble)"
      />

      {/* ── REGION LABELS ── */}
      <g fontFamily="Georgia, 'Times New Roman', serif" fill="#2a1a08" opacity="0.55" letterSpacing="3">
        <text x="480" y="105" textAnchor="middle" fontSize="14" fontStyle="italic" fontWeight="bold">THE FROSTMARCH</text>
        <text x="175" y="360" textAnchor="middle" fontSize="11" fontStyle="italic" transform="rotate(-15,175,360)">THE VERDANT</text>
        <text x="175" y="378" textAnchor="middle" fontSize="11" fontStyle="italic" transform="rotate(-15,175,378)">REACH</text>
        <text x="545" y="355" textAnchor="middle" fontSize="14" fontStyle="italic" fontWeight="bold">THE HEARTHLANDS</text>
        <text x="800" y="360" textAnchor="middle" fontSize="11" fontStyle="italic" transform="rotate(8,800,360)">THE ASHFIELDS</text>
        <text x="600" y="590" textAnchor="middle" fontSize="11" fontStyle="italic">AMBER EXPANSE</text>
        <text x="290" y="570" textAnchor="middle" fontSize="10" fontStyle="italic" transform="rotate(-5,290,570)">SALTMERE COAST</text>
      </g>

      {/* ── MOUNTAIN RANGES (Frostmarch) ── */}
      <g fill="#7a8a96" stroke="#4a5a66" strokeWidth="0.5" opacity="0.8">
        {/* Mountain glyph function — repeated triangles */}
        {[340,380,420,460,500,540,580,620,660,700,740].map((x, i) => (
          <polygon key={i} points={`${x},160 ${x-12},185 ${x+12},185`} />
        ))}
        {[360,400,440,480,520,560,600,640,680,720].map((x, i) => (
          <polygon key={i} points={`${x},175 ${x-9},192 ${x+9},192`} opacity="0.6" />
        ))}
        {/* Frostmarch peaks */}
        <polygon points="310,140 295,168 325,168" />
        <polygon points="340,130 322,162 358,162" />
        <polygon points="375,125 356,158 394,158" />
        <polygon points="760,145 744,172 776,172" />
        <polygon points="800,135 782,165 818,165" />
        <polygon points="840,130 820,162 860,162" />
      </g>

      {/* ── FOREST AREAS (Verdant Reach) ── */}
      <g fill="#2a5a2a" opacity="0.45">
        {[
          [155,280],[175,300],[155,320],[175,340],[155,360],
          [185,280],[205,300],[185,320],[205,340],[185,360],
          [215,280],[235,300],[215,320],[235,340],
          [155,400],[175,420],[155,440],[175,460],
          [205,400],[225,420],[205,440],
          [245,380],[265,400],[245,420],
        ].map(([cx, cy], i) => (
          <circle key={i} cx={cx} cy={cy} r={14} />
        ))}
        {/* Forest canopy tops */}
        {[
          [155,280],[185,280],[215,280],[155,360],[185,360],
        ].map(([cx, cy], i) => (
          <polygon key={i} points={`${cx},${cy-16} ${cx-10},${cy} ${cx+10},${cy}`} fill="#1a4a1a" />
        ))}
      </g>

      {/* ── DESERT DUNES (Amber Expanse) ── */}
      <g fill="#c89a3a" opacity="0.3" stroke="#a07828" strokeWidth="0.5">
        {[
          [570,560],[610,560],[650,560],[690,560],[730,555],
          [580,580],[620,578],[660,576],[700,574],
          [600,598],[640,596],[680,594],
        ].map(([cx, cy], i) => (
          <ellipse key={i} cx={cx} cy={cy} rx={18} ry={6} />
        ))}
      </g>

      {/* ── RIVERS ── */}
      <g fill="none" stroke="#4a6a8a" strokeWidth="1.5" opacity="0.6" strokeLinecap="round">
        {/* Main river through Hearthlands */}
        <path d="M500,195 C510,240 520,280 510,330 C500,380 490,420 495,460 C500,490 510,510 505,530" />
        {/* Western river through Verdant Reach */}
        <path d="M200,195 C210,240 205,300 195,360 C185,420 175,460 180,510" />
        {/* Northern melt streams */}
        <path d="M380,190 C385,220 390,250 395,280" />
        <path d="M620,185 C625,215 620,240 615,270" />
      </g>

      {/* ── ROADS ── */}
      <g fill="none" stroke="#8b6914" strokeWidth="1.2" opacity="0.5" strokeDasharray="6,4">
        {/* King's Road: Crosshaven to Hammergate */}
        <path d="M480,310 C480,270 480,230 480,190" />
        {/* East Road: Crosshaven to Threshold */}
        <path d="M480,310 C540,320 580,340 640,380 C680,410 700,420 700,420" />
        {/* South Road: Crosshaven to Twinford */}
        <path d="M480,310 C490,360 492,400 490,440" />
        {/* West Road: to Verdant Reach */}
        <path d="M480,310 C420,320 360,330 290,350 C260,360 230,370 200,380" />
        {/* Coast Road */}
        <path d="M200,500 C210,530 215,555 200,580" />
      </g>

      {/* ── TOWN DOTS ── */}
      {/* Major cities — larger dots with glow */}
      <g>
        {[
          { x: 480, y: 310, name: 'Crosshaven',     major: true },
          { x: 480, y: 140, name: 'Hammergate',     major: true },
          { x: 200, y: 500, name: 'Harborfall',     major: true },
          { x: 640, y: 580, name: 'Oasis of Kareth',major: true },
          { x: 820, y: 500, name: 'Resonance Core', major: false, isDungeon: true },
        ].map(({ x, y, name, major, isDungeon }) => (
          <g key={name}>
            {major && <circle cx={x} cy={y} r={9} fill="#f5d56e" opacity="0.3" />}
            <circle
              cx={x} cy={y} r={major ? 5 : 3.5}
              fill={isDungeon ? '#8b0000' : major ? '#f5d56e' : '#d4a940'}
              stroke={isDungeon ? '#ff4444' : '#3d1f00'}
              strokeWidth="1"
            />
          </g>
        ))}

        {/* Towns — standard dots */}
        {[
          { x: 420, y: 360, name: 'Millhaven' },
          { x: 460, y: 400, name: 'Duskwall' },
          { x: 530, y: 370, name: 'Ironpost' },
          { x: 490, y: 440, name: 'Twinford' },
          { x: 640, y: 390, name: 'Cinderholm' },
          { x: 700, y: 420, name: 'Threshold' },
          { x: 760, y: 460, name: 'Scratchwork' },
          { x: 220, y: 380, name: 'Leafsong' },
          { x: 190, y: 430, name: 'Thornhaven' },
          { x: 160, y: 360, name: 'Rootsdeep' },
          { x: 360, y: 110, name: 'Coldpeak' },
          { x: 580, y: 130, name: 'Deepvein' },
          { x: 680, y: 560, name: 'Sandrest' },
          { x: 720, y: 600, name: 'Dunewatch' },
          { x: 230, y: 550, name: 'Wavebreak' },
          { x: 170, y: 590, name: 'Saltspire' },
        ].map(({ x, y, name }) => (
          <circle key={name} cx={x} cy={y} r={3.5} fill="#d4a940" stroke="#3d1f00" strokeWidth="0.8" />
        ))}

        {/* Dungeon markers — red X */}
        {[
          { x: 480, y: 315, name: 'Aelorian Vault' },
          { x: 680, y: 440, name: 'Ashcrypt' },
          { x: 582, y: 135, name: 'Deep Wound' },
          { x: 190, y: 560, name: 'Coral Temple' },
          { x: 155, y: 395, name: 'Root Labyrinth' },
        ].map(({ x, y, name }) => (
          <g key={name}>
            <line x1={x-4} y1={y-4} x2={x+4} y2={y+4} stroke="#cc2200" strokeWidth="1.5" />
            <line x1={x+4} y1={y-4} x2={x-4} y2={y+4} stroke="#cc2200" strokeWidth="1.5" />
          </g>
        ))}
      </g>

      {/* ── TOWN LABELS ── */}
      <g fontFamily="Georgia, serif" fontSize="8" fill="#1a0a00">
        {[
          { x: 480, y: 310, label: 'Crosshaven', dy: -8, anchor: 'middle', bold: true },
          { x: 480, y: 140, label: 'Hammergate', dy: -8, anchor: 'middle', bold: true },
          { x: 200, y: 500, label: 'Harborfall',  dy: -8, anchor: 'middle', bold: true },
          { x: 640, y: 580, label: 'Oasis of Kareth', dy: -8, anchor: 'middle', bold: true },
          { x: 420, y: 360, label: 'Millhaven',   dy: -7, anchor: 'middle' },
          { x: 460, y: 400, label: 'Duskwall',    dy: -7, anchor: 'middle' },
          { x: 530, y: 370, label: 'Ironpost',    dy: -7, anchor: 'start' },
          { x: 490, y: 440, label: 'Twinford',    dy: -7, anchor: 'middle' },
          { x: 640, y: 390, label: 'Cinderholm',  dy: -7, anchor: 'middle' },
          { x: 700, y: 420, label: 'Threshold',   dy: -7, anchor: 'middle' },
          { x: 760, y: 460, label: 'Scratchwork', dy: -7, anchor: 'start' },
          { x: 220, y: 380, label: 'Leafsong',    dy: -7, anchor: 'start' },
          { x: 190, y: 430, label: 'Thornhaven',  dy: -7, anchor: 'start' },
          { x: 160, y: 360, label: 'Rootsdeep',   dy: -7, anchor: 'end' },
          { x: 360, y: 110, label: 'Coldpeak',    dy: -7, anchor: 'middle' },
          { x: 580, y: 130, label: 'Deepvein',    dy: -7, anchor: 'middle' },
          { x: 680, y: 560, label: 'Sandrest',    dy: -7, anchor: 'middle' },
          { x: 720, y: 600, label: 'Dunewatch',   dy: -7, anchor: 'middle' },
          { x: 230, y: 550, label: 'Wavebreak',   dy: -7, anchor: 'start' },
          { x: 170, y: 590, label: 'Saltspire',   dy: -7, anchor: 'end' },
          { x: 820, y: 500, label: 'Resonance Core', dy: 14, anchor: 'middle', bold: true, danger: true },
        ].map(({ x, y, label, dy, anchor, bold, danger }) => (
          <text
            key={label}
            x={x} y={y + dy}
            textAnchor={anchor as 'middle' | 'start' | 'end'}
            fontWeight={bold ? 'bold' : 'normal'}
            fontSize={bold ? '9' : '7.5'}
            fill={danger ? '#8b0000' : '#1a0a00'}
          >
            {label}
          </text>
        ))}
      </g>

      {/* ── COMPASS ROSE ── */}
      <g transform="translate(75,75)">
        {/* Outer ring */}
        <circle r="28" fill="#f0e8cc" stroke="#8b6914" strokeWidth="1.5" opacity="0.9" />
        <circle r="24" fill="none" stroke="#8b6914" strokeWidth="0.5" />
        {/* Cardinal points */}
        <polygon points="0,-24 -4,-10 4,-10" fill="#3d1f00" />
        <polygon points="0,24 -4,10 4,10" fill="#8b6914" />
        <polygon points="-24,0 -10,-4 -10,4" fill="#8b6914" />
        <polygon points="24,0 10,-4 10,4" fill="#8b6914" />
        {/* N star */}
        <polygon points="0,-24 -2,-16 0,-20 2,-16" fill="#cc0000" />
        {/* Center */}
        <circle r="3.5" fill="#3d1f00" />
        <circle r="2" fill="#f5d56e" />
        {/* Labels */}
        <text x="0" y="-29" textAnchor="middle" fontSize="8" fontWeight="bold" fill="#3d1f00" fontFamily="Georgia,serif">N</text>
        <text x="0" y="38" textAnchor="middle" fontSize="7" fill="#3d1f00" fontFamily="Georgia,serif">S</text>
        <text x="-34" y="3" textAnchor="middle" fontSize="7" fill="#3d1f00" fontFamily="Georgia,serif">W</text>
        <text x="34" y="3" textAnchor="middle" fontSize="7" fill="#3d1f00" fontFamily="Georgia,serif">E</text>
      </g>

      {/* ── SCALE BAR ── */}
      <g transform="translate(830,655)">
        <rect x="0" y="0" width="80" height="8" fill="#3d1f00" opacity="0.7" />
        <rect x="0" y="0" width="40" height="8" fill="#f0e8cc" opacity="0.7" />
        <text x="40" y="18" textAnchor="middle" fontSize="7" fill="#3d1f00" fontFamily="Georgia,serif">50 leagues</text>
      </g>

      {/* ── TITLE CARTOUCHE ── */}
      <g transform="translate(800,30)">
        <rect x="-55" y="-18" width="175" height="40" rx="4"
          fill="#f0e8cc" stroke="#8b6914" strokeWidth="1.5" opacity="0.92" />
        <text x="32" y="-2" textAnchor="middle" fontSize="13" fontWeight="bold" fill="#3d1f00"
          fontFamily="Georgia,'Times New Roman',serif" letterSpacing="1">ELARYN</text>
        <text x="32" y="14" textAnchor="middle" fontSize="8" fill="#5a3a1a"
          fontFamily="Georgia,serif" fontStyle="italic">247 PA — Post-Ashen Era</text>
      </g>

      {/* ── LEGEND ── */}
      <g transform="translate(14,600)" fontFamily="Georgia,serif" fontSize="7.5" fill="#1a0a00">
        <rect x="-4" y="-14" width="115" height="88" rx="3"
          fill="#f0e8cc" stroke="#8b6914" strokeWidth="1" opacity="0.88" />
        <text x="52" y="0" textAnchor="middle" fontSize="8" fontWeight="bold">LEGEND</text>
        <circle cx="8" cy="14" r="4" fill="#f5d56e" stroke="#3d1f00" strokeWidth="0.8" />
        <text x="16" y="17">Major City</text>
        <circle cx="8" cy="28" r="3" fill="#d4a940" stroke="#3d1f00" strokeWidth="0.8" />
        <text x="16" y="31">Town</text>
        <g transform="translate(6,40)">
          <line x1="-3" y1="-3" x2="3" y2="3" stroke="#cc2200" strokeWidth="1.5" />
          <line x1="3" y1="-3" x2="-3" y2="3" stroke="#cc2200" strokeWidth="1.5" />
        </g>
        <text x="16" y="45">Dungeon</text>
        <line x1="2" y1="56" x2="16" y2="56" stroke="#8b6914" strokeWidth="1.2" strokeDasharray="4,3" />
        <text x="20" y="59">Road</text>
        <line x1="2" y1="70" x2="16" y2="70" stroke="#4a6a8a" strokeWidth="1.5" />
        <text x="20" y="73">River</text>
      </g>

      {/* ── VIGNETTE OVERLAY ── */}
      <rect width="1000" height="700" fill="url(#vignette)" />

      {/* ── BORDER ── */}
      <rect x="4" y="4" width="992" height="692" rx="6"
        fill="none" stroke="#8b6914" strokeWidth="3" opacity="0.6" />
      <rect x="8" y="8" width="984" height="684" rx="4"
        fill="none" stroke="#8b6914" strokeWidth="1" opacity="0.4" />
    </svg>
  )
}
