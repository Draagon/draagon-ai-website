# draagon.ai

## Overview

Marketing website for Draagon AI cognitive architecture framework at https://draagon.ai. Static site hosted on Cloudflare Pages with DNS on Cloudflare.

## Stack

- Pure HTML/CSS — no framework, no build step
- Hosted on Cloudflare Pages (direct upload via Wrangler)
- DNS: Cloudflare (nameservers: ethan.ns.cloudflare.com, lady.ns.cloudflare.com)
- Domain registered at Namecheap (nameservers pointed to Cloudflare)
- Email: Cloudflare Email Routing → doug@dougmealing.com

## Project Structure

```
draagon.ai/
├── index.html              # Main page
├── style.css               # Styles
├── favicon.svg             # Browser tab icon (dragon head)
├── 404.html                # Custom 404 page
├── deploy.sh               # Deploy to Cloudflare Pages
├── images/
│   ├── logo.svg            # Dragon head logo (light, for dark bg)
│   ├── logo_head-480x365.png   # Dragon head PNG (small)
│   └── logo_head-960x730.png   # Dragon head PNG (large)
├── CLAUDE.md               # This file
├── README.md               # Project readme
└── .gitignore              # Git ignores
```

## Related Projects

- **Framework:** ~/Development/draagon-ai (the actual AI framework)
- **Company site:** ~/Development/draagon.com (draagon.com)
- **Roxy:** ~/Development/roxy-voice-assistant (reference implementation)

## Logo

Same dragon head as draagon.com, sourced from ~/Development/draagon-ai/images/. Recolored for dark theme.

## Deployment

```bash
./deploy.sh
```

Preview URL: https://draagon-ai.pages.dev
Production URL: https://draagon.ai (once nameservers updated at Namecheap)

## Cloudflare Configuration

| Setting | Value |
|---------|-------|
| Zone ID | `859249a13393a6a8573912e4f11232f4` |
| Account ID | `330cb0efc83f8b1597896a9e85399636` |
| Pages Project | `draagon-ai` |
| SSL | Full |
| Always HTTPS | On |
| Minification | HTML, CSS, JS |

### Cloudflare API Access

Credentials stored at `~/.config/cloudflare/credentials`.

## DNS Records

| Type | Name | Value | Notes |
|------|------|-------|-------|
| CNAME | @ | draagon-ai.pages.dev | Proxied |
| CNAME | www | draagon-ai.pages.dev | Proxied |
| MX | @ | route{1,2,3}.mx.cloudflare.net | Auto-managed by Email Routing |
| TXT | @ | v=spf1 include:_spf.mx.cloudflare.net ~all | SPF |
| TXT | _dmarc | v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s | DMARC |

## Email Routing

All email forwards to `doug@dougmealing.com`:
- `doug@draagon.ai` → doug@dougmealing.com
- `hello@draagon.ai` → doug@dougmealing.com
- Catch-all (*@draagon.ai) → doug@dougmealing.com

## GitHub

- Repo: https://github.com/Draagon/draagon-ai-website

## Nameserver Migration

**Status: Pending** — Need to update nameservers at Namecheap:
1. Log into Namecheap → draagon.ai → Domain → Nameservers → Custom DNS
2. Change from `dns1.registrar-servers.com` / `dns2.registrar-servers.com`
3. Set to: `ethan.ns.cloudflare.com` / `lady.ns.cloudflare.com`
4. Propagation: 1-24 hours

## Website Content

The site showcases Draagon AI's key capabilities:
- **4-Layer Cognitive Memory** — Working, Episodic, Semantic, Metacognitive with reinforcement learning
- **Semantic Expansion** — Two-pass understanding with disambiguation and evidence gathering
- **Belief System** — Confidence tracking, conflict reconciliation, graceful corrections
- **Real Personality** — Quantified traits that evolve, single/multi-persona modes
- **Multi-Agent Orchestration** — Shared working memory, role-based filtering, consensus
- **Curiosity Engine** — Knowledge gap detection, proactive questioning, opinion formation

Use cases: Voice Assistants (Roxy), Game NPCs (Mindcraft), Domain-Specific Agents (Healthcare)

**Note:** Draagon AI is currently in closed development. The website reflects this — no GitHub links, no "open source" language. CTA directs to email contact for early access / partnership inquiries. Update the site when ready to go public.

## Future Plans

- Add code examples / quick start section
- Benchmark results visualization
- Interactive memory diagram
- Documentation section linking to framework docs
- Blog / changelog
