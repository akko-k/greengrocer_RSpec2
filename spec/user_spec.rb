RSpec.describe User do
  # 不要 ▼単体テスト 正常系（Userクラスのインスタンス生成）

  # ▼単体テスト5 異常系(choose_productメソッド)※入力ミスに対応できているかどうかを確認（大きい整数，0，負の整数，文字列）
  # ▼単体テスト5 正常系(choose_productメソッド)
  describe ".choose_product" do
    let(:product_params) do
      [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
    end
    let(:greengrocer) { Greengrocer.new(product_params) }
    let(:products) { greengrocer.products }

    context "大きい整数を入力したとき" do
      it '再入力を促すこと' do
        select_product_num = StringIO.new("100\n")
        pronpt_re_enter_msg = "#{products.first.id}から#{products.last.id}の番号から選んでください。"
        allow(ARGF).to receive(:gets) { select_product_num.gets }
        expect { User.new.choose_product(products) }
          .to output(pronpt_re_enter_msg).to_stdout
      end
    end
    context "0を入力したとき" do
      it '再入力を促すこと' do
      end
    end
    context "負の整数を入力したとき" do
      it '再入力を促すこと' do
      end
    end
    context "文字列を入力したとき" do
      it '再入力を促すこと' do
      end
    end
  end
end
