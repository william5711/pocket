# Pocket

A phone-first money app: one monthly spending cap, spending by category, cashback across your cards, and balances for bank, brokerage and credit card accounts. Add it to your iPhone Home Screen and it runs full screen like an app.

It's a single static page (`index.html`) hosted on GitHub Pages. Data is stored in your own Supabase project and syncs between devices.

## Setup

1. **Supabase project.** Create a free project at [supabase.com](https://supabase.com).
2. **Database.** In the project, open **SQL Editor**, paste the contents of [`setup.sql`](setup.sql), and run it.
3. **Email sign-in codes.** In **Authentication → Emails → Templates**, add `{{ .Token }}` to the **Magic Link** template (and the **Confirm signup** template), for example `Your Pocket code is {{ .Token }}`. Pocket signs in with a 6-digit code, because email links can't open inside a Home Screen app.
4. **Connect the app.** In **Project Settings → API**, copy the **Project URL** and the **anon public** key into [`config.js`](config.js). The anon key is designed to be public; the row rules in `setup.sql` keep each person's data private.
5. **Allowed site.** In **Authentication → URL Configuration**, set **Site URL** to the GitHub Pages address.

## Install on iPhone

Open the GitHub Pages address in **Safari**, sign in with your email code, then **Share → Add to Home Screen**. The icon comes from `icons/apple-touch-icon.png`.

## Moving data in

Settings → **Import data file** accepts a `pocket-export-1` JSON file (for example, the export made from the Claude version of Pocket). Export files contain personal data, so they're ignored by `.gitignore` and should never be committed.
