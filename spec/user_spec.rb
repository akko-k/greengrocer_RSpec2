RSpec.describe User do
  # 不要 ▼単体テスト 正常系（Userクラスのインスタンス生成）

  describe ".choose_product" do
    let(:product_params) do
      [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
    end
    let(:greengrocer) { Greengrocer.new(product_params) }
    let(:products) { greengrocer.products }
    let(:user) { User.new }

    # ▼単体テスト5 正常系(choose_productメソッド)
    context "存在するidを入力したとき" do
      let(:correct_input) { "#{products.first.id}\n" }
      it '@chosen_productとproduct_paramsの名前と同じであること' do
        allow(ARGF).to receive(:gets){ correct_input }
        user.choose_product(products)
        expect(user.chosen_product.name).to eq product_params[0][:name]
      end

      it '@chosen_productとproduct_paramsの金額が同じであること' do
        allow(ARGF).to receive(:gets){ correct_input }
        user.choose_product(products)
        expect(user.chosen_product.price).to eq product_params[0][:price]
      end
    end

    # ▼単体テスト5 異常系(choose_productメソッド)※入力ミスに対応できているかどうかを確認（大きい整数，0，負の整数，文字列）
    context "idとして存在しない大きい整数を入力したとき" do
      it '再入力を促すこと' do
        wrong_input = "100\n"
        correct_input = "#{products.first.id}\n"
        allow(ARGF).to receive(:gets).and_return wrong_input, correct_input
        pronpt_choose_id_msg = "商品の番号を選択 >"
        pronpt_re_enter_msg = "#{products.first.id}から#{products.last.id}の番号から選んでください。"
        expect { User.new.choose_product(products) }
          .to output(pronpt_choose_id_msg + pronpt_re_enter_msg + "\n" + pronpt_choose_id_msg ).to_stdout
      end
    end

    context "idとして存在しない0を入力したとき" do
    end

    context "idとして存在しない負の整数を入力したとき" do
    end

    context "文字列を入力したとき" do
    end

  end
end