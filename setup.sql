-- Run once in Supabase → SQL Editor.
-- Every document Pocket saves (settings, accounts, each transaction) is one row, keyed by its path.

create table if not exists public.docs (
  user_id    uuid        not null default auth.uid() references auth.users (id) on delete cascade,
  path       text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, path)
);

-- Only the signed-in owner can read or change their rows.
alter table public.docs enable row level security;

drop policy if exists "Own rows only" on public.docs;
create policy "Own rows only" on public.docs
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Live updates between your phone and computer.
alter publication supabase_realtime add table public.docs;
