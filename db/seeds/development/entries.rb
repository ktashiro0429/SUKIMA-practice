body =
"私は○○大学四年生の○○です。\n"+
"将来は○○になりたいと思っています。\n"+
"そんな私は○○のような人になりたいため\n"+
"○○のような仕事を大学生のうちに体験したいです！"
%w(Taro Jiro Hana).each do |name|
    user = User.find_by(name: name)
    0.upto(9) do |idx|
        Entry.create(
            author: user,
            title:"営業がしたい#{idx}",
            body: body,
            posted_at: 10.days.ago.advance(days:idx),
            status: %w(draft member_only public)[idx % 3])
        end
    end