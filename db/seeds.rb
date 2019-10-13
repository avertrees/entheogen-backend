# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    post1 = Post.create(
        {
            title: "Lorem ipsum dolor",
            description: "Lorem ipsum dolor amet blue bottle mixtape shabby chic, distillery next level vaporware VHS glossier 8-bit. ", 
            body: "Cronut everyday carry organic banjo jean shorts ethical, blue bottle viral swag crucifix edison bulb taxidermy. Paleo bitters flexitarian portland fam. Taxidermy 3 wolf moon flexitarian, aesthetic activated charcoal hella beard bitters. Yr wayfarers truffaut, iceland offal salvia prism 8-bit pitchfork fixie. Thundercats bespoke tote bag, readymade dreamcatcher deep v waistcoat taiyaki. Vape palo santo venmo, stumptown readymade post-ironic farm-to-table salvia thundercats. Kale chips YOLO everyday carry af, tilde freegan helvetica mustache offal neutra bushwick. Heirloom waistcoat taiyaki humblebrag kombucha keytar messenger bag 8-bit chartreuse hashtag pork belly lyft. Occupy green juice edison bulb four loko, twee taxidermy chartreuse banjo hoodie irony man braid keytar whatever.", 
            image_url: "http://www.pethealthnetwork.com/sites/default/files/content/images/cardigan-welsh-corgi100642967.png",
            user_id: 3
    }
    )
    post2 = Post.create(
        {
            title: "Yr cliche health",
            description: "Goth Tofu",
            body: "Meh celiac locavore cold-pressed lyft asymmetrical vinyl XOXO keffiyeh la croix. Ramps plaid lomo pop-up brunch iPhone taxidermy iceland thundercats pinterest occupy twee green juice gochujang. Prism gastropub tousled freegan chia, lomo banjo try-hard vaporware post-ironic. 8-bit kinfolk put a bird on it fashion axe. Bicycle rights tacos cronut hell of. Succulents flannel iPhone biodiesel retro poutine photo booth yuccie lumbersexual cardigan master cleanse lyft portland.",
            image_url: "https://thehappypuppysite.com/wp-content/uploads/2018/05/Pembroke-Welsh-Corgi-HP-long.jpg",
            user_id: 3
        }
        )  
    p3 = Post.create(
        {
        title: "Heirloom waistcoat ", 
        description: "four loko, twee taxidermy", 
        body: "DIY neutra humblebrag schlitz, etsy knausgaard fanny pack letterpress mixtape cliche pabst butcher. Tousled sriracha helvetica, dreamcatcher deep v chicharrones blue bottle pour-over actually fingerstache four dollar toast. Art party paleo gentrify ugh drinking vinegar beard pitchfork tilde vice. Blue bottle migas four loko, irony butcher pug mixtape salvia. Distillery man braid everyday carry 8-bit pok pok sartorial food truck vinyl. Pork belly pour-over disrupt, man bun blue bottle selvage twee scenester celiac bitters vexillologist cred. Edison bulb scenester bitters brooklyn pitchfork.", 
        image_url: "https://i.pinimg.com/originals/94/ca/7f/94ca7f471b9e07aa92df7c284513b2d7.jpg",
        user_id: 3
    }
    ) 
