# メールアドレスの形式をチェックする
#
# [使用法]
#   email = 'taro@xyz..jp'
#   well_formed_as_email_address(email)    # => false
module EmailAddressChecker
  # 文字列がメールアドレスの形式として正しければ true を返す。
  def well_formed_as_email_address(str)
    md = str.match(/^([^@]+)@([^@]+)$/)
    return false unless md
    local_part, domain_part = md[1], md[2]
    return false unless well_formed_as_local_part(local_part)
    return false unless well_formed_as_domain_part(domain_part)
    return true
  end

  # 自らがメールアドレスのローカルパート(@よりも前の部分)として形式的に正しければ true を返す。
  #
  # ここで採用しているルールは以下の通り:
  #   * ダブルクオートで囲まれている場合は、ダブルクオート以外の全ての文字を許す。
  #   * そうでない場合は、以下の文字だけで構成されていれば許す。
  #     * 英数字
  #     * 特殊文字 ! # $ % & ' * + - / = ? ^ _ ` { | } ~
  #     * 先頭または末尾以外のドット(.)
  #
  # (注) システムによっては、メールアドレスの形式のルールをこれよりも厳しく、
  # あるいは緩くしている場合もある。アプリケーションの使用状況に応じて、
  # 条件を追加または削除すること。
  def well_formed_as_local_part(str)
    case str
    when /^"[^"]+"$/
      true
    else
      return false if str =~ %r"[^\w#!$%&'*+-\/=?^`{|}~]"
      return false if str =~ /^\./
      return false if str =~ /\.$/
    end
    true
  end

  # 自らがメールアドレスのドメインパート(@よりも後の部分)として形式的に正しければ true を返す。
  #
  # ここで採用しているルールは以下の通り:
  #   * 英数字、ドット、ハイフンのみを含む。
  #   * ドットを必ず含む。
  #   * ドットで分割(split)してできた配列の最後の要素(トップドメイン名)は
  #     2文字以上7文字以下のアルファベット
  #   * ドットで分割してできた配列の最後以外の要素は、英数字とハイフンのみを含む。
  #     ただし、ハイフンは文字列の先頭または末尾にあってはならず、2個以上連続してはならない。
  #
  # (注) 日本語ドメイン名やIPアドレスを使用したメールアドレスには対応していない。
  def well_formed_as_domain_part(str)
    return if str.match(/[^A-Za-z0-9.\-]/)
    return unless str.match(/\./)
    names = str.split(/\./)
    return unless names.pop.match(/^[a-z]{2,7}$/i)
    names.each do |name|
      return unless name.match(/^\w+(-\w+)*$/)
    end
    true
  end
end
