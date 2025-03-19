import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:carwash/Constants/SliverAppBar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        MySliverAppBar(context,title: "Profile"),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: greyClr.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration:  const BoxDecoration(
                      shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/profile.jpg"))),
                  ),
                ),
                Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Yalagala Srinivas", style: TxtStyles.labelStyle),
                        Text(
                          "srinivas.y@gmail.com",
                          style: TxtStyles.labelStyle,
                        ),
                        Text("8247467723", style: TxtStyles.labelStyle),
                      ],
                    )),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: greyClr.withOpacity(0.15),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text("General",style: TxtStyles.headerStyle),
                ProfileTile(icon: Icons.person_outline,title: "Edit Profile",subtitle: "Change profile,name,email & phone etc..."),
                ProfileTile(icon: Icons.lock_outline,title: "Change Password",subtitle: "Update and Strength account security..."),
                ProfileTile(icon: Icons.directions_car_outlined,title: "My Vehicles",subtitle: "All your vehicles info..."),
                ProfileTile(icon: Icons.credit_card_outlined,title: "Add Cards",subtitle: "Securely and payment method..."),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: greyClr.withOpacity(0.15),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text("Preferences",style: TxtStyles.headerStyle),
                ProfileTile(icon: Icons.privacy_tip_outlined,title: "Terms of Use",subtitle: "User terms and conditions etc..."),
                ProfileTile(icon: Icons.notifications_outlined,title: "Notifications",subtitle: "Customize you notification preferences..."),
                ProfileTile(icon: Icons.info_outline_rounded,title: "FAQ",subtitle: "Frequently asked questions..."),
                ProfileTile(icon: Icons.logout_outlined,title: "Log Out",subtitle: "Securely Log out of account",color: g4),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
      ],
    );
  }
  Widget ProfileTile({required IconData icon,required String title,required String subtitle,color=indClr}){
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(backgroundColor:color.withOpacity(0.1),child: Icon(icon,color: color)),
      title: Text(title,style: title=="Log Out"?TxtStyles.errorStyle:TxtStyles.labelStyle),
      subtitle: Text(subtitle,style: TxtStyles.smallHintStyle),
      trailing: title=="Notifications"?Transform.scale(alignment:Alignment.centerRight,scale: 0.75,child: Switch(activeColor:g3,inactiveTrackColor:greyClr,activeTrackColor:g3.withOpacity(0.25),value: true, onChanged: (value){})):const Icon(Icons.arrow_forward_ios,size: 17.5,),
    );
  }
}
