# Deploy This Project to Railway or Render

This project is a legacy Java web app (WAR). The repo now contains:
- `Dockerfile` to run Tomcat + WAR
- `render.yaml` for Render blueprint deploy
- DB settings read from env vars: `DB_URL`, `DB_USER`, `DB_PASS`, `DB_DRIVER`

## 1) Prepare Database (Required)
Use any managed MySQL provider you like (Aiven, Railway MySQL, Neon-compatible MySQL providers, etc).

Run this SQL file on the DB:
- `DB/Enabling.sql`

Create an app DB user with limited permissions.

## 2) Deploy to Railway
1. Push this project to GitHub.
2. In Railway: New Project -> Deploy from GitHub repo.
3. Railway detects `Dockerfile` and builds container.
4. In service Variables, set:
   - `DB_DRIVER=com.mysql.jdbc.Driver`
   - `DB_URL=jdbc:mysql://<host>:3306/enabling?useSSL=true&allowPublicKeyRetrieval=true`
   - `DB_USER=<db_user>`
   - `DB_PASS=<db_pass>`
5. Deploy and open generated domain.

## 3) Deploy to Render
1. Push this project to GitHub.
2. In Render: New -> Blueprint.
3. Select repo; Render uses `render.yaml`.
4. Fill secrets for:
   - `DB_URL`
   - `DB_USER`
   - `DB_PASS`
5. Deploy and open the Render URL.

## 4) Important Post-Deploy Checks
- Test login page loads.
- Test DB-backed pages (register/login).
- Change default hardcoded admin/role credentials in application code.
- Configure custom domain + HTTPS.

## Notes
- This app still includes old coding patterns (SQL concatenation, default credentials). It can run, but should be hardened before production.
