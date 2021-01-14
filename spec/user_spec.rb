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

    context "idとイコールではない大きい整数を入力したとき" do
      it '再入力を促すこと' do
        id = Product.class_variable_get('@@count')
        input = "100\n"
        pronpt_re_enter_msg = "#{products.first.id}から#{products.last.id}の番号から選んでください。"
        allow(ARGF).to receive(:gets) { input }
        expect { User.new.choose_product(products) }
          .to output(pronpt_re_enter_msg).to_stdout
        allow(ARGF).to receive(:exit) { input }
        # expect { User.new.choose_product(products) }
        #   .to 
      end
    end

    context "idとイコールではない0を入力したとき" do
    end

    context "idとイコールではない負の整数を入力したとき" do
    end

    context "文字列を入力したとき" do
    end

  end
end