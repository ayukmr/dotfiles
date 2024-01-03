// =================================
// === Move Toolbar Into Sidebar ===
// =================================

// run after startup
_ucUtils.startupFinished().then(() => {
  const sidebar = document.getElementById('sidebar-box');
  const toolbar = document.getElementById('navigator-toolbox');

  // move toolbar into sidebar
  sidebar.prepend(toolbar);

  const tabsToolbar     = document.getElementById('TabsToolbar');
  const extensionButton = document.getElementById('unified-extensions-button');
  const extensionItems  = document.querySelectorAll('#nav-bar .unified-extensions-item');
  const privateIcon     = document.getElementById('private-browsing-indicator-with-label')

  // move additional icons into tabs toolbar
  tabsToolbar.prepend(privateIcon);
  tabsToolbar.append(...extensionItems);
  tabsToolbar.append(extensionButton);
});
