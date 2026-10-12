-- Supabase の SQL Editor に貼り付けて「Run」する（最初に1回だけ）
create table if not exists public.docs (
  user_id    uuid not null default auth.uid() references auth.users on delete cascade,
  coll       text not null,
  id         text not null,
  data       jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, coll, id)
);

alter table public.docs enable row level security;

drop policy if exists "own rows" on public.docs;
create policy "own rows" on public.docs
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

alter publication supabase_realtime add table public.docs;
