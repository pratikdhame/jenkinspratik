<%@ taglib prefix="tagfiles" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Pratik — DevOps Engineer</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=JetBrains+Mono:wght@300;400;500&display=swap" rel="stylesheet" />
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg:       #0a0c10;
      --surface:  #111318;
      --border:   #1e2230;
      --muted:    #3a3f52;
      --text-dim: #8892a4;
      --text:     #c9d1e0;
      --white:    #eef1f8;
      --accent:   #00e5ff;
      --accent2:  #7b5ea7;
      --green:    #00d68f;
      --orange:   #ff8c42;
    }

    html { scroll-behavior: smooth; }

    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'Space Grotesk', sans-serif;
      font-size: 16px;
      line-height: 1.6;
      overflow-x: hidden;
    }

    /* ── GRID NOISE TEXTURE ─────────────────────────────── */
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background-image:
        linear-gradient(rgba(0,229,255,.03) 1px, transparent 1px),
        linear-gradient(90deg, rgba(0,229,255,.03) 1px, transparent 1px);
      background-size: 48px 48px;
      pointer-events: none;
      z-index: 0;
    }

    /* ── NAV ─────────────────────────────────────────────── */
    nav {
      position: fixed;
      top: 0; left: 0; right: 0;
      z-index: 100;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 5vw;
      height: 64px;
      background: rgba(10,12,16,.85);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid var(--border);
    }

    .nav-logo {
      font-family: 'JetBrains Mono', monospace;
      font-size: 14px;
      color: var(--accent);
      letter-spacing: .08em;
    }
    .nav-logo span { color: var(--text-dim); }

    .nav-links {
      display: flex;
      gap: 32px;
      list-style: none;
    }
    .nav-links a {
      font-size: 13px;
      font-weight: 500;
      letter-spacing: .08em;
      text-transform: uppercase;
      color: var(--text-dim);
      text-decoration: none;
      transition: color .2s;
    }
    .nav-links a:hover { color: var(--accent); }

    /* ── HERO ────────────────────────────────────────────── */
    .hero {
      position: relative;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 120px 5vw 80px;
      overflow: hidden;
      z-index: 1;
    }

    /* Glowing orb background */
    .hero::after {
      content: '';
      position: absolute;
      top: -200px; right: -200px;
      width: 600px; height: 600px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(0,229,255,.12) 0%, transparent 70%);
      pointer-events: none;
    }
    .hero-orb2 {
      position: absolute;
      bottom: -150px; left: -100px;
      width: 450px; height: 450px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(123,94,167,.10) 0%, transparent 70%);
      pointer-events: none;
    }

    .hero-eyebrow {
      font-family: 'JetBrains Mono', monospace;
      font-size: 13px;
      color: var(--accent);
      letter-spacing: .18em;
      text-transform: uppercase;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
      gap: 12px;
    }
    .hero-eyebrow::before {
      content: '';
      width: 32px; height: 1px;
      background: var(--accent);
    }

    .hero h1 {
      font-size: clamp(52px, 8vw, 100px);
      font-weight: 700;
      line-height: 1.0;
      letter-spacing: -.03em;
      color: var(--white);
      margin-bottom: 8px;
    }

    .hero h1 .name-accent {
      background: linear-gradient(135deg, var(--accent) 0%, var(--accent2) 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .hero-role {
      font-size: clamp(18px, 3vw, 28px);
      font-weight: 300;
      color: var(--text-dim);
      margin-bottom: 36px;
      letter-spacing: .01em;
    }
    .hero-role strong {
      color: var(--text);
      font-weight: 500;
    }

    .hero-desc {
      max-width: 520px;
      font-size: 17px;
      color: var(--text-dim);
      line-height: 1.75;
      margin-bottom: 48px;
    }

    .hero-cta {
      display: flex;
      gap: 16px;
      flex-wrap: wrap;
    }

    .btn-primary {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 14px 28px;
      background: var(--accent);
      color: #000;
      font-family: 'Space Grotesk', sans-serif;
      font-size: 14px;
      font-weight: 600;
      letter-spacing: .06em;
      text-transform: uppercase;
      border: none;
      cursor: pointer;
      text-decoration: none;
      transition: all .2s;
      clip-path: polygon(0 0, calc(100% - 10px) 0, 100% 10px, 100% 100%, 0 100%);
    }
    .btn-primary:hover {
      background: #fff;
      transform: translateY(-2px);
    }

    .btn-ghost {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 13px 28px;
      background: transparent;
      color: var(--text);
      font-family: 'Space Grotesk', sans-serif;
      font-size: 14px;
      font-weight: 500;
      letter-spacing: .06em;
      text-transform: uppercase;
      border: 1px solid var(--border);
      cursor: pointer;
      text-decoration: none;
      transition: all .2s;
    }
    .btn-ghost:hover {
      border-color: var(--accent);
      color: var(--accent);
      transform: translateY(-2px);
    }

    /* ── STATUS BADGE ────────────────────────────────────── */
    .status-badge {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 8px 16px;
      background: rgba(0,214,143,.08);
      border: 1px solid rgba(0,214,143,.2);
      border-radius: 2px;
      font-family: 'JetBrains Mono', monospace;
      font-size: 12px;
      color: var(--green);
      margin-top: 56px;
    }
    .status-dot {
      width: 7px; height: 7px;
      border-radius: 50%;
      background: var(--green);
      animation: pulse 2s ease infinite;
    }
    @keyframes pulse {
      0%, 100% { opacity: 1; }
      50% { opacity: .3; }
    }

    /* ── SECTION COMMON ──────────────────────────────────── */
    section {
      position: relative;
      z-index: 1;
      padding: 100px 5vw;
    }

    .section-label {
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      color: var(--accent);
      letter-spacing: .2em;
      text-transform: uppercase;
      margin-bottom: 12px;
    }

    .section-title {
      font-size: clamp(28px, 4vw, 42px);
      font-weight: 700;
      color: var(--white);
      letter-spacing: -.02em;
      margin-bottom: 56px;
      line-height: 1.1;
    }

    .divider {
      height: 1px;
      background: var(--border);
      margin: 0 5vw;
    }

    /* ── STATS ROW ───────────────────────────────────────── */
    .stats-row {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
      gap: 1px;
      background: var(--border);
      border: 1px solid var(--border);
      margin: 0 5vw;
    }
    .stat-cell {
      background: var(--bg);
      padding: 36px 28px;
      text-align: center;
    }
    .stat-cell .num {
      font-size: 42px;
      font-weight: 700;
      color: var(--white);
      line-height: 1;
      letter-spacing: -.04em;
    }
    .stat-cell .num span { color: var(--accent); }
    .stat-cell .label {
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      color: var(--text-dim);
      letter-spacing: .12em;
      text-transform: uppercase;
      margin-top: 8px;
    }

    /* ── SKILLS ──────────────────────────────────────────── */
    .skills-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 1px;
      background: var(--border);
      border: 1px solid var(--border);
    }

    .skill-card {
      background: var(--surface);
      padding: 32px;
      transition: background .2s;
      position: relative;
      overflow: hidden;
    }
    .skill-card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 2px;
      background: linear-gradient(90deg, var(--accent), var(--accent2));
      transform: scaleX(0);
      transform-origin: left;
      transition: transform .3s;
    }
    .skill-card:hover::before { transform: scaleX(1); }
    .skill-card:hover { background: #13161f; }

    .skill-icon {
      font-size: 28px;
      margin-bottom: 16px;
    }
    .skill-card h3 {
      font-size: 15px;
      font-weight: 600;
      color: var(--white);
      margin-bottom: 10px;
      letter-spacing: -.01em;
    }
    .skill-card p {
      font-size: 13px;
      color: var(--text-dim);
      line-height: 1.65;
      margin-bottom: 20px;
    }
    .skill-tags {
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
    }
    .tag {
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      padding: 4px 10px;
      background: var(--bg);
      border: 1px solid var(--border);
      color: var(--text-dim);
      letter-spacing: .04em;
    }

    /* ── TOOLS ───────────────────────────────────────────── */
    .tools-section { background: var(--surface); }

    .tools-marquee-wrap {
      overflow: hidden;
      padding: 24px 0;
      border-top: 1px solid var(--border);
      border-bottom: 1px solid var(--border);
      margin-bottom: 60px;
    }
    .tools-marquee {
      display: flex;
      gap: 48px;
      animation: marquee 22s linear infinite;
      white-space: nowrap;
      width: max-content;
    }
    @keyframes marquee {
      0% { transform: translateX(0); }
      100% { transform: translateX(-50%); }
    }
    .tool-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      font-family: 'JetBrains Mono', monospace;
      font-size: 13px;
      color: var(--muted);
      letter-spacing: .06em;
    }
    .tool-pill .dot { color: var(--accent); }

    /* ── EXPERIENCE TIMELINE ─────────────────────────────── */
    .timeline {
      display: flex;
      flex-direction: column;
      gap: 0;
      position: relative;
      padding-left: 28px;
      border-left: 1px solid var(--border);
    }

    .tl-item {
      position: relative;
      padding: 0 0 48px 36px;
    }
    .tl-item:last-child { padding-bottom: 0; }

    .tl-dot {
      position: absolute;
      left: -7px; top: 6px;
      width: 13px; height: 13px;
      border-radius: 50%;
      background: var(--bg);
      border: 2px solid var(--accent);
    }
    .tl-dot.dim { border-color: var(--muted); }

    .tl-date {
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      color: var(--accent);
      letter-spacing: .1em;
      text-transform: uppercase;
      margin-bottom: 6px;
    }
    .tl-title {
      font-size: 18px;
      font-weight: 600;
      color: var(--white);
      letter-spacing: -.01em;
      margin-bottom: 4px;
    }
    .tl-company {
      font-size: 13px;
      color: var(--text-dim);
      margin-bottom: 12px;
    }
    .tl-desc {
      font-size: 14px;
      color: var(--text-dim);
      line-height: 1.7;
      max-width: 520px;
    }

    /* ── PROJECTS ────────────────────────────────────────── */
    .projects-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
      gap: 1px;
      background: var(--border);
      border: 1px solid var(--border);
    }

    .proj-card {
      background: var(--surface);
      padding: 32px;
      display: flex;
      flex-direction: column;
      gap: 12px;
      transition: background .2s;
      cursor: default;
    }
    .proj-card:hover { background: #13161f; }

    .proj-num {
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      color: var(--muted);
      letter-spacing: .1em;
    }
    .proj-card h3 {
      font-size: 17px;
      font-weight: 600;
      color: var(--white);
      letter-spacing: -.01em;
    }
    .proj-card p {
      font-size: 13px;
      color: var(--text-dim);
      line-height: 1.65;
      flex: 1;
    }
    .proj-stack {
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
      margin-top: 8px;
    }
    .stack-tag {
      font-family: 'JetBrains Mono', monospace;
      font-size: 10px;
      padding: 3px 8px;
      border: 1px solid var(--border);
      color: var(--accent);
      letter-spacing: .06em;
    }

    /* ── CONTACT ─────────────────────────────────────────── */
    .contact-section {
      background: var(--surface);
      border-top: 1px solid var(--border);
      border-bottom: 1px solid var(--border);
    }
    .contact-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 64px;
      align-items: start;
    }
    .contact-desc {
      font-size: 15px;
      color: var(--text-dim);
      line-height: 1.8;
      margin-bottom: 32px;
    }
    .contact-links {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }
    .contact-link {
      display: flex;
      align-items: center;
      gap: 12px;
      font-family: 'JetBrains Mono', monospace;
      font-size: 13px;
      color: var(--text-dim);
      text-decoration: none;
      padding: 14px 16px;
      border: 1px solid var(--border);
      transition: all .2s;
    }
    .contact-link:hover {
      border-color: var(--accent);
      color: var(--accent);
    }
    .contact-link .icon { font-size: 16px; }

    .contact-form {
      display: flex;
      flex-direction: column;
      gap: 16px;
    }
    .form-field {
      display: flex;
      flex-direction: column;
      gap: 6px;
    }
    .form-field label {
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      color: var(--text-dim);
      letter-spacing: .1em;
      text-transform: uppercase;
    }
    .form-field input,
    .form-field textarea {
      background: var(--bg);
      border: 1px solid var(--border);
      color: var(--white);
      font-family: 'Space Grotesk', sans-serif;
      font-size: 14px;
      padding: 12px 16px;
      outline: none;
      resize: vertical;
      transition: border-color .2s;
    }
    .form-field input:focus,
    .form-field textarea:focus {
      border-color: var(--accent);
    }
    .form-field textarea { min-height: 100px; }

    /* ── FOOTER ──────────────────────────────────────────── */
    footer {
      padding: 32px 5vw;
      display: flex;
      justify-content: space-between;
      align-items: center;
      z-index: 1;
      position: relative;
    }
    footer p {
      font-family: 'JetBrains Mono', monospace;
      font-size: 12px;
      color: var(--muted);
    }

    /* ── RESPONSIVE ──────────────────────────────────────── */
    @media (max-width: 768px) {
      nav { padding: 0 24px; }
      .nav-links { display: none; }
      section { padding: 72px 24px; }
      .contact-grid { grid-template-columns: 1fr; gap: 40px; }
      .stats-row { margin: 0 24px; }
      .divider { margin: 0 24px; }
    }
  </style>
</head>
<body>

  <!-- NAV -->
  <nav>
    <div class="nav-logo"><span>~/</span>pratik</div>
    <ul class="nav-links">
      <li><a href="#skills">Skills</a></li>
      <li><a href="#experience">Experience</a></li>
      <li><a href="#projects">Projects</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
  </nav>

  <!-- HERO -->
  <section class="hero">
    <div class="hero-orb2"></div>
    <div class="hero-eyebrow">Available for opportunities</div>
    <h1>Hey, I'm<br><span class="name-accent">Pratik.</span></h1>
    <p class="hero-role"><strong>DevOps Engineer</strong> — building infrastructure that ships.</p>
    <p class="hero-desc">
      I architect CI/CD pipelines, containerize workloads, and wrangle Kubernetes clusters on AWS — so engineering teams can deploy fast and sleep at night.
    </p>
    <div class="hero-cta">
      <a href="#projects" class="btn-primary">↓ View My Work</a>
      <a href="#contact" class="btn-ghost">Get In Touch</a>
    </div>
    <div class="status-badge">
      <span class="status-dot"></span>
      Systems Online · Mumbai, India
    </div>
  </section>

  <div class="divider"></div>

  <!-- STATS -->
  <div class="stats-row">
    <div class="stat-cell">
      <div class="num">3<span>+</span></div>
      <div class="label">Years Experience</div>
    </div>
    <div class="stat-cell">
      <div class="num">15<span>+</span></div>
      <div class="label">Projects Shipped</div>
    </div>
    <div class="stat-cell">
      <div class="num">99<span>%</span></div>
      <div class="label">Pipeline Uptime</div>
    </div>
    <div class="stat-cell">
      <div class="num">∞</div>
      <div class="label">Coffee Consumed</div>
    </div>
  </div>

  <div class="divider" style="margin-top:0"></div>

  <!-- SKILLS -->
  <section id="skills">
    <div class="section-label">// what I do</div>
    <h2 class="section-title">Core Competencies</h2>
    <div class="skills-grid">

      <div class="skill-card">
        <div class="skill-icon">🚀</div>
        <h3>CI/CD Pipelines</h3>
        <p>End-to-end automation from code commit to production. Multi-node Jenkins architectures with GitHub webhook integration, parallel stages, and artifact management.</p>
        <div class="skill-tags">
          <span class="tag">Jenkins</span>
          <span class="tag">GitHub Actions</span>
          <span class="tag">Webhooks</span>
          <span class="tag">EFS</span>
        </div>
      </div>

      <div class="skill-card">
        <div class="skill-icon">☸️</div>
        <h3>Kubernetes & Containers</h3>
        <p>Designing container-native workloads with Ingress routing, service discovery, and multi-stage Docker builds that separate build and runtime concerns cleanly.</p>
        <div class="skill-tags">
          <span class="tag">Kubernetes</span>
          <span class="tag">Docker</span>
          <span class="tag">Nginx Ingress</span>
          <span class="tag">Helm</span>
        </div>
      </div>

      <div class="skill-card">
        <div class="skill-icon">☁️</div>
        <h3>AWS Cloud Infrastructure</h3>
        <p>Provisioning and managing VPCs, EC2 fleets, EFS shared storage, and IAM policies. Hands-on with multi-AZ networking and cost-aware architecture patterns.</p>
        <div class="skill-tags">
          <span class="tag">EC2</span>
          <span class="tag">VPC</span>
          <span class="tag">EFS</span>
          <span class="tag">IAM</span>
          <span class="tag">S3</span>
        </div>
      </div>

      <div class="skill-card">
        <div class="skill-icon">🔐</div>
        <h3>Security & Secrets</h3>
        <p>SSH key management, RSA/PEM certificate handling, NFS v4.1 persistence, and least-privilege IAM. Keeping pipelines locked down without slowing them down.</p>
        <div class="skill-tags">
          <span class="tag">SSH Keys</span>
          <span class="tag">TLS/SSL</span>
          <span class="tag">IAM Roles</span>
          <span class="tag">NFS</span>
        </div>
      </div>

      <div class="skill-card">
        <div class="skill-icon">📦</div>
        <h3>Build & Artifact Management</h3>
        <p>Multi-stage builds, WAR/JAR packaging for Java apps, Docker named volumes for artifact passing, and shared EFS mounts across agent nodes.</p>
        <div class="skill-tags">
          <span class="tag">Maven</span>
          <span class="tag">Tomcat</span>
          <span class="tag">JDK 21</span>
          <span class="tag">Docker Compose</span>
        </div>
      </div>

      <div class="skill-card">
        <div class="skill-icon">📊</div>
        <h3>Monitoring & Observability</h3>
        <p>Setting up structured logging, health checks, and uptime monitoring. Believing that if you can't observe it, you can't trust it in production.</p>
        <div class="skill-tags">
          <span class="tag">Prometheus</span>
          <span class="tag">Grafana</span>
          <span class="tag">CloudWatch</span>
          <span class="tag">Logs</span>
        </div>
      </div>

    </div>
  </section>

  <!-- TOOLS MARQUEE -->
  <section class="tools-section" id="tools">
    <div class="section-label">// tech stack</div>
    <h2 class="section-title">Tools I Work With</h2>
    <div class="tools-marquee-wrap">
      <div class="tools-marquee">
        <span class="tool-pill"><span class="dot">▸</span> Jenkins</span>
        <span class="tool-pill"><span class="dot">▸</span> Kubernetes</span>
        <span class="tool-pill"><span class="dot">▸</span> Docker</span>
        <span class="tool-pill"><span class="dot">▸</span> AWS EC2</span>
        <span class="tool-pill"><span class="dot">▸</span> Terraform</span>
        <span class="tool-pill"><span class="dot">▸</span> Nginx</span>
        <span class="tool-pill"><span class="dot">▸</span> GitHub Actions</span>
        <span class="tool-pill"><span class="dot">▸</span> Linux Ubuntu</span>
        <span class="tool-pill"><span class="dot">▸</span> Helm</span>
        <span class="tool-pill"><span class="dot">▸</span> Prometheus</span>
        <span class="tool-pill"><span class="dot">▸</span> Grafana</span>
        <span class="tool-pill"><span class="dot">▸</span> Maven</span>
        <span class="tool-pill"><span class="dot">▸</span> Tomcat</span>
        <span class="tool-pill"><span class="dot">▸</span> Amazon EFS</span>
        <!-- duplicate for seamless loop -->
        <span class="tool-pill"><span class="dot">▸</span> Jenkins</span>
        <span class="tool-pill"><span class="dot">▸</span> Kubernetes</span>
        <span class="tool-pill"><span class="dot">▸</span> Docker</span>
        <span class="tool-pill"><span class="dot">▸</span> AWS EC2</span>
        <span class="tool-pill"><span class="dot">▸</span> Terraform</span>
        <span class="tool-pill"><span class="dot">▸</span> Nginx</span>
        <span class="tool-pill"><span class="dot">▸</span> GitHub Actions</span>
        <span class="tool-pill"><span class="dot">▸</span> Linux Ubuntu</span>
        <span class="tool-pill"><span class="dot">▸</span> Helm</span>
        <span class="tool-pill"><span class="dot">▸</span> Prometheus</span>
        <span class="tool-pill"><span class="dot">▸</span> Grafana</span>
        <span class="tool-pill"><span class="dot">▸</span> Maven</span>
        <span class="tool-pill"><span class="dot">▸</span> Tomcat</span>
        <span class="tool-pill"><span class="dot">▸</span> Amazon EFS</span>
      </div>
    </div>
  </section>

  <!-- EXPERIENCE -->
  <section id="experience">
    <div class="section-label">// career</div>
    <h2 class="section-title">Experience</h2>
    <div class="timeline">

      <div class="tl-item">
        <div class="tl-dot"></div>
        <div class="tl-date">2023 — Present</div>
        <div class="tl-title">DevOps Engineer</div>
        <div class="tl-company">Cloud Infrastructure & Automation</div>
        <div class="tl-desc">
          Architecting multi-node Jenkins CI/CD systems on AWS. Managing EC2 fleets, EFS shared storage across agent nodes, and Kubernetes Ingress-based routing for containerized workloads. Reduced deployment time by over 60% through pipeline automation.
        </div>
      </div>

      <div class="tl-item">
        <div class="tl-dot dim"></div>
        <div class="tl-date">2022 — 2023</div>
        <div class="tl-title">Infrastructure Engineer</div>
        <div class="tl-company">Cloud & Systems</div>
        <div class="tl-desc">
          Built Docker Compose workflows and multi-stage Dockerfiles for Java-based web applications. Worked on VPC design, subnet configuration, and IAM role policies on AWS.
        </div>
      </div>

      <div class="tl-item">
        <div class="tl-dot dim"></div>
        <div class="tl-date">2021 — 2022</div>
        <div class="tl-title">Systems Administrator</div>
        <div class="tl-company">Linux & Server Operations</div>
        <div class="tl-desc">
          Managed Ubuntu server environments, SSH security, NFS mounts, and Nginx server block configuration. First exposure to container orchestration with Docker.
        </div>
      </div>

    </div>
  </section>

  <div class="divider"></div>

  <!-- PROJECTS -->
  <section id="projects">
    <div class="section-label">// recent work</div>
    <h2 class="section-title">Featured Projects</h2>
    <div class="projects-grid">

      <div class="proj-card">
        <div class="proj-num">01</div>
        <h3>Jenkins Multi-Node CI/CD</h3>
        <p>Full pipeline for a Java web app: master + 2 slave nodes on AWS EC2 (Ubuntu 22.04), GitHub webhook triggers, EFS shared storage, and automated Tomcat deployment.</p>
        <div class="proj-stack">
          <span class="stack-tag">Jenkins</span>
          <span class="stack-tag">AWS EC2</span>
          <span class="stack-tag">EFS</span>
          <span class="stack-tag">Tomcat</span>
          <span class="stack-tag">GitHub</span>
        </div>
      </div>

      <div class="proj-card">
        <div class="proj-num">02</div>
        <h3>Kubernetes Ingress Routing</h3>
        <p>Host/path-based routing through a Kubernetes Ingress Controller to multiple Nginx-backed static web apps (Netflix clone, Amazon Prime Video clone) on the same cluster.</p>
        <div class="proj-stack">
          <span class="stack-tag">Kubernetes</span>
          <span class="stack-tag">Nginx</span>
          <span class="stack-tag">Ingress</span>
          <span class="stack-tag">Docker</span>
        </div>
      </div>

      <div class="proj-card">
        <div class="proj-num">03</div>
        <h3>Containerized Java App</h3>
        <p>Migrated <code style="color:var(--accent);font-family:monospace;font-size:12px">eb-tomcat-snakes</code> to a split multi-stage Docker build — separate Dockerfile.build and Dockerfile.run with artifact passing via named volumes, moving off deprecated base images.</p>
        <div class="proj-stack">
          <span class="stack-tag">Docker</span>
          <span class="stack-tag">eclipse-temurin</span>
          <span class="stack-tag">Compose</span>
          <span class="stack-tag">Maven</span>
        </div>
      </div>

      <div class="proj-card">
        <div class="proj-num">04</div>
        <h3>AWS VPC & Network Design</h3>
        <p>Designed and provisioned a production-ready VPC with public/private subnets, route tables, and security groups to host a Jenkins CI/CD cluster across multiple AZs.</p>
        <div class="proj-stack">
          <span class="stack-tag">AWS VPC</span>
          <span class="stack-tag">Subnets</span>
          <span class="stack-tag">Security Groups</span>
          <span class="stack-tag">IAM</span>
        </div>
      </div>

    </div>
  </section>

  <!-- CONTACT -->
  <section class="contact-section" id="contact">
    <div class="section-label">// let's talk</div>
    <h2 class="section-title">Get In Touch</h2>
    <div class="contact-grid">
      <div>
        <p class="contact-desc">
          Open to new roles, freelance infrastructure work, or just talking DevOps. If you're building something and need pipelines that don't break at 2 AM — reach out.
        </p>
        <div class="contact-links">
          <a href="mailto:pratik@example.com" class="contact-link">
            <span class="icon">✉</span> pratik@example.com
          </a>
          <a href="https://github.com/pratikdhameltm" class="contact-link" target="_blank">
            <span class="icon">⌥</span> github.com/pratikdhameltm
          </a>
          <a href="https://linkedin.com/in/pratik" class="contact-link" target="_blank">
            <span class="icon">∟</span> linkedin.com/in/pratik
          </a>
          <a href="#" class="contact-link">
            <span class="icon">◎</span> Mumbai, Maharashtra, India
          </a>
        </div>
      </div>
      <div class="contact-form">
        <div class="form-field">
          <label>Your Name</label>
          <input type="text" placeholder="John Doe" />
        </div>
        <div class="form-field">
          <label>Email</label>
          <input type="email" placeholder="you@company.com" />
        </div>
        <div class="form-field">
          <label>Message</label>
          <textarea placeholder="Tell me about your project..."></textarea>
        </div>
        <button class="btn-primary" style="align-self:flex-start" onclick="alert('Message sent! (Connect this to your backend)')">Send Message →</button>
      </div>
    </div>
  </section>

  <!-- FOOTER -->
  <footer>
    <p>© 2026 Pratik — Built with intention.</p>
    <p>Mumbai · India · UTC+5:30</p>
  </footer>

</body>
</html>












