// Same as newsletter, but capturing multiple senders.
local newsletter(label, from, multiple=false) = {
  filter: { from: from, isEscaped: multiple},
  actions: {
    markRead: true,
    category: "forums",
    labels: [ label ]
  }
};


local group(label, to) = {
  filter: { to: to },
  actions: {
    markRead: true,
    category: "forums",
    labels: [ label ]
  }
};

{
  version: "v1alpha3",
  author: {
    name: "Irfan Sharif",
    email: "irfanmahmoudsharif@gmail.com"
  },
  labels: [
    { name: "!", color: { background: "#000000", text: "#ffffff" } },
    { name: "Andalus" },
    { name: "S" },
    { name: "S/Ava", color: { background: "#fb4c2f", text: "#ffffff" } },
    { name: "S/Aeon" },
    { name: "S/Generalist" },
    { name: "S/ACM Queue" },
    { name: "S/MIT Press" },
    { name: "S/Benedict's Newsletter", color: { background: "#ffc8af", text: "#7a2e0b" } },
    { name: "S/Brandur" },
    { name: "S/CityLab" },
    { name: "S/Common Cog" },
    { name: "S/Danco" },
    { name: "S/Hillel Wayne" },
    { name: "S/Pull Request" },
    { name: "S/Skallas" },
    { name: "S/Public Domain Review" },
    { name: "S/New Atlantis" },
    { name: "S/David Chapman" },
    { name: "S/Diff" },
    { name: "S/Every" },
    { name: "S/FS" },
    { name: "S/Fermat's Library" },
    { name: "S/Gates Notes", color: { background: "#98d7e4", text: "#0d3b44" } },
    { name: "S/Increment", color: { background: "#b99aff", text: "#ffffff" } },
    { name: "S/Irrational Exuberance", color: { background: "#fbe983", text: "#594c05" } },
    { name: "S/Linus Lee" },
    { name: "S/Literary Hub" },
    { name: "S/Marginal Revolution" },
    { name: "S/Metadata", color: { background: "#ffad46", text: "#ffffff" } },
    { name: "S/Money Stuff", color: { background: "#16a765", text: "#ffffff" } },
    { name: "S/Morning Paper", color: { background: "#4986e7", text: "#ffffff" } },
    { name: "S/Nadia's Newsletter", color: { background: "#2da2bb", text: "#ffffff" } },
    { name: "S/Nelhage", color: { background: "#16a765", text: "#ffffff" } },
    { name: "S/Philip Guo", color: { background: "#fb4c2f", text: "#ffffff" } },
    { name: "S/Pudding" },
    { name: "S/Quanta" },
    { name: "S/Renovatio" },
    { name: "S/Simon Sarris" },
    { name: "S/Slava", color: { background: "#fb4c2f", text: "#ffffff" } },
    { name: "S/Software Lead" },
    { name: "S/Solana", color: { background: "#fb4c2f", text: "#ffffff" } },
    { name: "S/Stratechery", color: { background: "#ff7537", text: "#ffffff" } },
    { name: "S/Works In Progress" },
    { name: "S/a16z" },
    { name: "L" },
    { name: "L/Playbit" },
    { name: "A" },
    { name: "A/New York Times" },
    { name: "A/New Yorker" },
    { name: "A/Reading Design" },
    { name: "A/The Economist" },
    { name: "A/The Information" },
    { name: "io", color: { background: "#000000", text: "#ffffff" } },
    { name: "uwaterloo.ca", color: { background: "#fbe983", text: "#594c05" } },
    { name: "CIBC", color: { background: "#fb4c2f", text: "#ffffff" } },
    { name: "Github", color: { background: "#000000", text: "#ffffff" } },
  ],
  rules: [
    newsletter("S/Ava", "ava@substack.com"),
    newsletter("S/Benedict's Newsletter", "list@ben-evans.com"),
    newsletter("S/Danco", "danco@substack.com"),
    newsletter("S/Public Domain Review", "newsletter@publicdomainreview.org"),
    newsletter("S/New Atlantis", "editor@thenewatlantis.com"),
    newsletter("S/Hillel Wayne", "hillelwayne@mail.buttondown.email"),
    newsletter("S/Pull Request", "pullrequest@substack.com"),
    newsletter("S/Skallas", "paulskallas@substack.com"),
    newsletter("S/David Chapman", "dc@meaningness.com"),
    newsletter("S/Diff", "diff@substack.com"),
    newsletter("S/Every", "hello@every.to"),
    newsletter("S/FS", "newsletter@farnamstreetblog.com"),
    newsletter("S/Linus Lee", "linus@thesephist.com"),
    newsletter("S/Marginal Revolution", "Marginal REVOLUTION"),
    newsletter("S/Nadia's Newsletter", "nayafia@substack.com"),
    newsletter("S/Quanta", "quanta@simonsfoundation.org"),
    newsletter("S/Renovatio", "renovatio@zaytuna.edu"),
    newsletter("S/Software Lead", "oren@softwareleadweekly.com"),
    newsletter("S/Solana", "solana@substack.com"),
    newsletter("S/Nelhage", "nelhage@nelhage.com"),
    newsletter("S/Money Stuff", "noreply@mail.bloombergview.com"),
    newsletter("S/Increment", "Increment"),
    newsletter("S/Irrational Exuberance", "will@lethain.com"),
    newsletter("S/Metadata", "Metadata"),
    newsletter("S/Pudding", "sup@pudding.cool"),
    newsletter("S/Simon Sarris", "simonsarris@substack.com"),
    newsletter("S/Fermat's Library" , "team@fermatslibrary.com"),
    newsletter("S/Gates Notes", "billg@gatesnotes.com"),
    newsletter("S/Morning Paper", "the-morning-paper@onelanday.co.uk"),
    newsletter("S/Brandur", "nanoglyph@list.brandur.org"),
    newsletter("S/Aeon", "newsletter@aeon.co"),
    newsletter("S/Generalist", "mario@readthegeneralist.com"),
    newsletter("S/ACM Queue", "slaybaugh@hq.acm.org"),
    newsletter("S/MIT Press", "thereader@mit.edu"),
    newsletter("S/Literary Hub", "lithub@lithub.com"),
    newsletter("S/Common Cog", "cedric@commoncog.com"),
    newsletter("S/a16z", "{fintechnewsletter@a16z.com newsletter@a16z.com enterprisenewsletter@a16z.com}", true),
    newsletter("S/Slava", "{defmacro@substack.com spakhm@substack.com}", true),
    newsletter("S/CityLab", "{citylab@bloomberg.net newsletters@citylab.com}", true),
    newsletter("S/Philip Guo", "{pgbovine@substack.com gpgp@substack.com}", true),
    newsletter("S/Stratechery", "{blog@stratechery.com membership@stratechery.com email@stratechery.com}", true),
    newsletter("S/Works In Progress", "hello@worksinprogress.co"),
    group("L/Playbit", "list@playb.it"),
    {
      filter: { query: "cibc" },
      actions: { category: "updates", labels: [ "CIBC" ] }
    },
    {
      filter: { query: "to:(+irfan.sharif@uwaterloo.ca) OR to:(+i4sharif@uwaterloo.ca)  OR to:(+irfan.sharif@edu.uwaterloo.ca)" },
      actions: { labels: [ "uwaterloo.ca" ] }
    },
    {
      filter: { and: [ { from: "notify@condocontrolcentral.com" }, { subject: "Item is being held for you" } ] },
      actions: { category: "personal" }
    },
    {
      filter: { to: "irfan@irfansharif.io" },
      actions: { markSpam: false, category: "personal", labels: [ "io" ] }
    },
    {
      filter: { from: "notifications@github.com" },
      actions: { category: "updates", labels: [ "Github" ] }
    },
    {
      filter: { from: "info@alandalusacademy.com" },
      actions: { category: "updates", labels: [ "Andalus" ] }
    },
  ]
}
