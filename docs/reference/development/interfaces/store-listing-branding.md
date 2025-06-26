(interfaces-store-listing-branding)=
# store-listing-branding

The store listing page of your application is an important tool to increase its visibility and discoverability. This listing is shown in the online [Snap Store](https://snapcraft.io/store), the [desktop app](https://snapcraft.io/snap-store) and in various other graphical store frontends such as GNOME Software and KDE Discover.

- [Metadata](#heading--metadata) such as a description and contact information helps users understand what your application has to offer and helps direct feedback to the right channels.
- [Media](#heading--media), including screenshots, a video and an icon, show off application functionality, design and brand.
- Create a [banner](#heading--banner) to help your application get featured in the store.
- For larger projects and ISVs, it might be useful to [Create a brand account](https://snapcraft.io/docs/t/creating-snap-store-brand-accounts/6271) in the name of the project or company.

<h2 id='heading--metadata'>Metadata</h2>

A snap's most important descriptive metadata, initially taken from its [snapcraft.yaml](/), can be conveniently edited from the Snap Store's web UI. The following fields are vitally important to help users find what they're looking for:

- ensure the **Title** is accurate and uses the correct case and spacing
- write a 79 character **Summary** to pitch the application to people browsing the store.
- Select up to two store **Categories** where your application will be featured.
- Use [Markdown](https://commonmark.org/help/) to format the **Description** to accurately describe the application and highlight its most important features. The following syntax is supported:
  - Bold: `**Foo**`
  - URLs: `https://foo.bar`
  - Lists: `* Foo`
  - Italics: `_Foo_`
  - Code: Text indented with 3 spaces or inside `

Use the **Additional information** section to add a license for your project, and also to select whether you want users to see where your snap is being used.

Under **Website and contact links**, include a link to the application website or product page so users can find out more about related products and services. The Contact link is intended to direct users to somewhere they can provide feedback about the application. It should point to a support site, forum or bug tracker.

The Snap Advocacy team love accurate and detailed metadata because they can create effective social campaigns and blog posts to highlight an application. Similarly, it can help to provide a brief functional overview in the *Description* and provide links for further detailed documentation.

<h2 id='heading--media'>Media</h2>

Second only in importance to the quality of a snap's metadata is the addition screenshots and other media to allow prospective users to preview the application.

<h3 id='heading--logo-icon'>Logo and icon</h2>

Uploading an icon or a logo will significantly improves the appearance of the application listing in graphical storefronts.

Icon/logo requirements:

- image formats: JPEG & PNG
- max resolution: 512x512
- aspect ratio: 1:1

> :information_source: this icon will only be used in graphical stores frontends, _not_ the desktop menu and dock. Those use the icon specified in the desktop entry files: [Desktop files for menu integration](https://snapcraft.io/docs/desktop-menu-icon-support).

<h3 id='heading--screenshots'>Screenshots</h2>

Each store entry can feature up to 5 screenshots (or animated GIFs). If the application is cross-platform, please upload screenshots taken from a Linux workstation rather than reusing screenshots from other platforms. The images or GIFs need to fit the following requirements:

Screenshot requirements:

- image formats: GIF, JPEG & PNG files
- min resolution: 480 x 480 pixels
- max resolution: 3840 x 2160 pixels
- aspect ratio: Between 1:2 and 2:1
- file size limit: 2MB
- animation min fps: 1
- animation max fps: 30
- animation max length: 40 seconds

> :information_source: PNG-formatted icons, logos and screenshots look better than JPEG.

<h3 id='heading--banner'>Banner and banner icon</h2>

![image|690x471](upload://ratdSJxHa8Icx3mgOdId7JxDITH.png) 

<br>

The above image shows how a banner and banner icon (top right) are used by the Snap Store.

Each week, the Snap Advocacy team will choose an application as the No.1 featured Snap in the store. Only Snaps with a banner qualify for promotion in the top spot. Uploading a banner does not guarantee the application will be featured, but it helps and the No.1 Editor’s Pick will typically generate a significant volume of new users.

Banner requirements:

- image formats: JPEG & PNG files
- min resolution: 720 x 240 pixels
  For best results on [the store](https://snapcraft.io/store) we recommend a resolution of 1920 x 640 pixels or greater
- max resolution: 4320 x 1440 pixels
- aspect ratio: 3:1
- file size limit: 2MB

Here’s an example banner:

![image|690x230](upload://6RYZAdE76wsmcZwtiBvBo1Ceref.jpeg)

