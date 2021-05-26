Map<String, int> phGroup = {
  //A難度
  "セアー（正交差）": 1,
  "バックセアー": 1,
  "旋回": 2,
  "開脚旋回": 2,
  "縦向き旋回": 2,
  "外向き旋回": 2,
  "サイド旋回": 2,
  // "横向き旋回1/4ひねり縦向き支持": 2,
  // "縦向き旋回1/4ひねり横向き支持": 2,
  // "上向き転向": 2,
  // "下向き正転向移動": 2,
  // "馬端下向き転向": 2,
  "横移動": 3,
  "ロシアン180°（270°）転向": 2,
  // "正面（背面）横移動": 3,
  // "縦向き後ろ移動（1/3部分）": 3,
  "下向き転向下り": 4,
  //B難度
  "セアーとび横移動": 1,
  "セアーひねり逆交差入れ": 1,
  "バックセアーとび横移動": 1,
  "バックセアーひねり正交差入れ": 1,
  // "(開脚)支持から後ろ抜き倒立、下ろして開脚支持": 1,
  // "一把手上横向き旋回": 2,
  "両ポメルを挟んで縦向き旋回": 2,
  // "一把手上縦向き旋回(前または後に1/4転向を伴っても)": 2,
  // "あん部馬背縦向き旋回": 2,
  // "横向き旋回ひねり": 2,
  // "馬端縦向き旋回ひねり": 2,
  // "(開脚)旋回倒立、下ろして開脚支持": 2,
  "シュテクリA": 2,
  "シュテクリB": 2,
  "ループ": 2,
  "フクガ": 2,
  // "把手上上向きとび転向": 2,
  // "一腕上上向き270°転向(縦向き〜横向き)": 2,
  // "直接トラムロー": 2,
  // "下向き逆移動": 2,
  // "スイスドゥーブル": 2,
  // "把手上(あん部馬背)下向き転向": 2,
  "把手上ロシアン360°(540°)転向": 2,
  "馬端馬背ロシアン360°(540°)転向": 2,
  "一把手上(あん部馬背)ロシアン180°(270°)転向": 2,
  "半前移動": 3,
  "Bバック": 3,
  // "正面横移動連続(馬端〜馬端)": 3,
  // "正面とび横移動": 3,
  // "背面横移動連続(馬端〜馬端)": 3,
  // "背面とび横移動": 3,
  // "縦向き1/3移動ひねり": 3,
  // "縦向き前(後ろ)移動1/4ひねり": 3,
  // "縦向き前移動(2/3 or 1/2部分)": 3,
  // "縦向き後ろ移動(2/3 or 1/2部分)": 3,
  // "シャギニアン下り": 4,
  "ロシアン360°(540°)転向下り": 4,
  // "下向き正面移動下向き転向下り": 4,
  // "(開脚)開脚旋回倒立下り・(開脚)旋回倒立3/4ひねり下り": 4,
  //C難度
  // "ステパンヤン": 1,
  "セアーとび横移動（馬端〜馬端）": 1,
  "セアー横移動ひねり逆交差入れ": 1,
  "バックセアーとび横移動（馬端〜馬端）": 1,
  // "(開脚)支持から後ろ抜き倒立、下ろして閉脚(開脚)旋回": 1,
  // "チッペルト": 2,
  // "背面とび横移動倒立経過、下ろして開脚支持": 2,
  // "下向き逆移動(or DSA) 倒立経過、下ろして開脚支持": 2,
  // "一腕上上向き270° 転向(横向き〜縦向き)": 2,
  // "一腕上下向き270°転向": 2,
  "把手上ロシアン720°(900°)転向": 2,
  "馬端馬背ロシアン720°(900°)転向": 2,
  "一把手上(あん部馬背)ロシアン360°(540°)転向": 2,
  // "正面横移動連続(馬端〜馬端：あん部馬背着手)": 3,
  // "正面とび横移動連続(馬端〜馬端)": 3,
  // "背面横移動連続(馬端〜馬端：あん部馬背着手)": 3,
  // "背面とび横移動連続(馬端〜馬端)": 3,
  // "縦向き(1/2 or 2/3)前(後ろ)移動ひねり": 3,
  // "全ての旋回移動ひねり": 3,
  // "縦向き前移動(3/3:馬端一把手一把手ー馬端)": 3,
  // "ビロゼルチェフ": 3,
  // "縦向き後ろ移動(3/3:馬端一把手一把手ー馬端)": 3,
  "前移動": 3,
  "Cトンフェイ": 3,
  "ウルジカ": 3,
  // "下向き正転向移動(把手間に着手なしで逆馬端へ)(横向き〜横向き支持、横向き〜縦向き支持、縦向き〜横向き支持)": 3,
  "把手を挟んだ横向き支持からロシアン360°転向移動": 3,
  // "クロル": 3,
  "ロシアン720°(900°)転向下り": 4,
  // "下向き逆移動(DSA)倒立下り": 4,
  "(開脚)旋回背面とび横移動倒立おり": 4,
  "C降り(シュテクリA)": 4,
  "C降り(逆リアー)": 4,
  //D難度
  "セアー倒立": 1,
  "リーニン": 1,
  "ミクラック": 1,
  // "逆交差1/4ひねり一把手上倒立経過、下ろして開脚支持": 1,
  // "ブライアン": 1,
  // "逆交差1/4ひねり倒立1/4ひねり逆把手に片腕支持逆交差入れ": 1,
  "Dフロップ": 2,
  "Dコンバイン": 2,
  // "縦向き旋回１回ひねり(２回以内の旋回で)": 2,
  // "セラスライ": 2,
  // "背面とび横移動倒立経過、下ろして開脚旋回": 2,
  // "ピネーロ": 2,
  // "把手上ロシアン1080°以上転向": 2,
  // "馬端馬背ロシアン1080°以上転向": 2,
  // "一把手上(あん部馬背)ロシアン720°(900°)転向": 2,
  // "１回の旋回で正面横移動(馬端から両把手を超えて逆馬端)": 3,
  "正面とび横移動(馬端〜馬端)": 3,
  // "２回の旋回で背面横移動(馬端馬背から両把手を超えて逆馬端馬背)": 3,
  "背面とび横移動(馬端〜馬端)": 3,
  "ニンレイズ": 3,
  "マジャール": 3,
  "シバド": 3,
  "モギルニー": 3,
  "ベレンキ": 3,
  "トンフェイ": 3,
  "ロス": 3,
  // "馬端外向き支持から下向き逆移動で反対の馬端外向き支持": 3,
  "コリバノフ": 4,
  "ロシアン1080°(以上)転向下り": 4,
  "D降り(シュテクリA)": 4,
  "D降り(逆リアー)": 4,
  // "DSA直後背面とび横移動倒立下り": 4,
  //E難度
  "アイヒホルン": 2,
  "セラスライ２": 2,
  "ベルキ": 2,
  "ショーン": 2,
  "ベズゴ": 2,
  "一把手上(あん部馬背)ロシアン1080°以上転向": 2,
  "Eフロップ": 2,
  "Eコンバイン": 2,
  "ウルジカ2": 3,
  "ヤマワキ": 3,
  // "正面横移動ひねり、背面横移動ひねり(馬端〜馬端)": 3,
  "ニンレイズ２": 3,
  "ドリッグス": 3,
  "開脚前移動": 3,
  "開脚後ろ移動(シバド)": 3,
  "ウ・グォニアン": 3,
  // "バンメン": 3,
  // "DSA倒立450°(以上)ひねり3/3部分移動下り": 3,
  "E降り(シュテクリA)": 4,
  "E降り(逆リアー)": 4,
  //F難度
  // "両把手を挟んで(開脚)旋回１回ひねり(２回以内の旋回で)": 2,
  "ブスナリ": 2,
};

Map<String, int> phDifficulty = {
  "セアー（正交差）": 1,
  "バックセアー": 1,
  "旋回": 1,
  "開脚旋回": 1,
  "縦向き旋回": 1,
  "外向き旋回": 1,
  // "横向き旋回1/4ひねり縦向き支持": 1,
  // "縦向き旋回1/4ひねり横向き支持": 1,
  // "上向き転向": 1,
  // "下向き正転向移動": 1,
  // "馬端下向き転向": 1,
  "横移動": 1,
  "ロシアン180°（270°）転向": 1,
  // "正面（背面）横移動": 1,
  // "縦向き後ろ移動（1/3部分）": 1,
  "下向き転向下り": 1,
  "セアーとび横移動": 2,
  "セアーひねり逆交差入れ": 2,
  "バックセアーとび横移動": 2,
  "バックセアーひねり正交差入れ": 2,
  // "(開脚)支持から後ろ抜き倒立、下ろして開脚支持": 2,
  // "一把手上横向き旋回": 2,
  "両ポメルを挟んで縦向き旋回": 2,
  // "一把手上縦向き旋回(前または後に1/4転向を伴っても)": 2,
  // "あん部馬背縦向き旋回": 2,
  // "横向き旋回ひねり": 2,
  // "馬端縦向き旋回ひねり": 2,
  // "(開脚)旋回倒立、下ろして開脚支持": 2,
  "シュテクリA": 2,
  "シュテクリB": 2,
  "ループ": 2,
  "フクガ": 2,
  // "把手上上向きとび転向": 2,
  // "一腕上上向き270°転向(縦向き〜横向き)": 2,
  // "直接トラムロー": 2,
  // "下向き逆移動": 2,
  // "スイスドゥーブル": 2,
  // "把手上(あん部馬背)下向き転向": 2,
  "把手上ロシアン360°(540°)転向": 2,
  "馬端馬背ロシアン360°(540°)転向": 2,
  "一把手上(あん部馬背)ロシアン180°(270°)転向": 2,
  "半前移動": 2,
  "Bバック": 2,
  // "正面横移動連続(馬端〜馬端)": 2,
  // "正面とび横移動": 2,
  // "背面横移動連続(馬端〜馬端)": 2,
  // "背面とび横移動": 2,
  // "縦向き1/3移動ひねり": 2,
  // "縦向き前(後ろ)移動1/4ひねり": 2,
  // "縦向き前移動(2/3 or 1/2部分)": 2,
  // "縦向き後ろ移動(2/3 or 1/2部分)": 2,
  // "シャギニアン下り": 2,
  "ロシアン360°(540°)転向下り": 2,
  // "下向き正面移動下向き転向下り": 2,
  // "(開脚)開脚旋回倒立下り・(開脚)旋回倒立3/4ひねり下り": 2,
  // "ステパンヤン": 3,
  "セアーとび横移動（馬端〜馬端）": 3,
  "セアー横移動ひねり逆交差入れ": 3,
  "バックセアーとび横移動（馬端〜馬端）": 3,
  // "(開脚)支持から後ろ抜き倒立、下ろして閉脚(開脚)旋回": 3,
  // "チッペルト": 3,
  // "背面とび横移動倒立経過、下ろして開脚支持": 3,
  // "下向き逆移動(or DSA) 倒立経過、下ろして開脚支持": 3,
  // "一腕上上向き270° 転向(横向き〜縦向き)": 3,
  // "一腕上下向き270°転向": 3,
  "把手上ロシアン720°(900°)転向": 3,
  "馬端馬背ロシアン720°(900°)転向": 3,
  "一把手上(あん部馬背)ロシアン360°(540°)転向": 3,
  // "正面横移動連続(馬端〜馬端：あん部馬背着手)": 3,
  // "正面とび横移動連続(馬端〜馬端)": 3,
  // "背面横移動連続(馬端〜馬端：あん部馬背着手)": 3,
  // "背面とび横移動連続(馬端〜馬端)": 3,
  // "縦向き(1/2 or 2/3)前(後ろ)移動ひねり": 3,
  // "全ての旋回移動ひねり": 3,
  // "縦向き前移動(3/3:馬端一把手一把手ー馬端)": 3,
  // "ビロゼルチェフ": 3,
  // "縦向き後ろ移動(3/3:馬端一把手一把手ー馬端)": 3,
  "前移動": 3,
  "Cトンフェイ": 3,
  "ウルジカ": 3,
  // "下向き正転向移動(把手間に着手なしで逆馬端へ)(横向き〜横向き支持、横向き〜縦向き支持、縦向き〜横向き支持)": 3,
  "把手を挟んだ横向き支持からロシアン360°転向移動": 3,
  // "クロル": 3,
  "ロシアン720°(900°)転向下り": 3,
  // "下向き逆移動(DSA)倒立下り": 3,
  "(開脚)旋回背面とび横移動倒立おり": 3,
  "C降り(シュテクリA)": 3,
  "C降り(逆リアー)": 3,
  "セアー倒立": 4,
  "リーニン": 4,
  "ミクラック": 4,
  // "逆交差1/4ひねり一把手上倒立経過、下ろして開脚支持": 4,
  // "ブライアン": 4,
  // "逆交差1/4ひねり倒立1/4ひねり逆把手に片腕支持逆交差入れ": 4,
  "Dフロップ": 4,
  "Dコンバイン": 4,
  // "縦向き旋回１回ひねり(２回以内の旋回で)": 4,
  // "セラスライ": 4,
  // "背面とび横移動倒立経過、下ろして開脚旋回": 4,
  // "ピネーロ": 4,
  // "把手上ロシアン1080°以上転向": 4,
  // "馬端馬背ロシアン1080°以上転向": 4,
  // "一把手上(あん部馬背)ロシアン720°(900°)転向": 4,
  // "１回の旋回で正面横移動(馬端から両把手を超えて逆馬端)": 4,
  "正面とび横移動(馬端〜馬端)": 4,
  // "２回の旋回で背面横移動(馬端馬背から両把手を超えて逆馬端馬背)": 4,
  "背面とび横移動(馬端〜馬端)": 4,
  "ニンレイズ": 4,
  "マジャール": 4,
  "シバド": 4,
  "モギルニー": 4,
  "ベレンキ": 4,
  "トンフェイ": 4,
  "ロス": 4,
  // "馬端外向き支持から下向き逆移動で反対の馬端外向き支持": 4,
  "コリバノフ": 4,
  "ロシアン1080°(以上)転向下り": 4,
  "D降り(シュテクリA)": 4,
  "D降り(逆リアー)": 4,
  // "DSA直後背面とび横移動倒立下り": 4,
  "アイヒホルン": 5,
  "セラスライ２": 5,
  "ベルキ": 5,
  "ショーン": 5,
  "ベズゴ": 5,
  "一把手上(あん部馬背)ロシアン1080°以上転向": 5,
  "Eフロップ": 5,
  "Eコンバイン": 5,
  "ウルジカ2": 5,
  "ヤマワキ": 5,
  // "正面横移動ひねり、背面横移動ひねり(馬端〜馬端)": 5,
  "ニンレイズ２": 5,
  "ドリッグス": 5,
  "開脚前移動": 5,
  "開脚後ろ移動(シバド)": 5,
  "ウ・グォニアン": 5,
  // "バンメン": 5,
  // "DSA倒立450°(以上)ひねり3/3部分移動下り": 5,
  "E降り(シュテクリA)": 5,
  "E降り(逆リアー)": 5,
  // "両把手を挟んで(開脚)旋回１回ひねり(２回以内の旋回で)": 6,
  "ブスナリ": 6,
};
