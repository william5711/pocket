# Pocket

A phone-first money app: one monthly spending cap, spending by category, cashback across your cards, and balances for bank, brokerage and credit card accounts. Add it to your iPhone Home Screen and it runs full screen like an app.

It's a single static page (`index.html`) hosted on GitHub Pages. Data is stored in your own Supabase project and syncs between devices.

## Setup

1. **Supabase project.** Create a free project at [supabase.com](https://supabase.com).
2. **Database.** In the project, open **SQL Editor**, paste the contents of [`setup.sql`](setup.sql), and run it.
3. **Sign-in.** Pocket uses email + password (Supabase's default). Leave **Confirm email** on: new accounts get one confirmation link, then sign in inside the app.
4. **Connect the app.** In **Project Settings → API Keys**, copy the **Project URL** and the **Publishable key** (`sb_publishable_…`) into [`config.js`](config.js). That key is designed to be public; the row rules in `setup.sql` keep each person's data private.
5. **Allowed site.** In **Authentication → URL Configuration**, set **Site URL** to the GitHub Pages address.

## Install on iPhone

Open the GitHub Pages address in **Safari**, then **Share → Add to Home Screen**, open Pocket from the new icon, and sign in there (a Home Screen app keeps its own sign-in, separate from Safari). The icon comes from `icons/apple-touch-icon.png`.

## Moving data in

Settings → **Import data file** accepts a `pocket-export-1` JSON file (for example, the export made from the Claude version of Pocket). Export files contain personal data, so they're ignored by `.gitignore` and should never be committed.
