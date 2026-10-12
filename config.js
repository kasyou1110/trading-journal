// Supabase の設定。Project Settings → API の「Project URL」と「anon public」キーを入れる。
// anon キーはページに書いて使う前提の公開用キー（記録は Row Level Security で本人しか読めない）。
// service_role キーは絶対にここに書かない。
window.JOURNAL_CONFIG = {
  supabaseUrl: "",
  supabaseKey: "",
};
