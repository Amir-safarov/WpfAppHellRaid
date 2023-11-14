using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Model;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace WpfAppHellRaid.Components
{
    internal class ModernNavigation
    {
        private static List<PageComponent> storylist = new List<PageComponent>();
        public static MainWindow mainWindow;

        public static void NextPage(PageComponent page)
        {
            storylist.Add(page);
            Update(page);
        }

        private static void Update(PageComponent page)
        {
            mainWindow.BackBTN.Visibility = storylist.Count() > 1 ? System.Windows.Visibility.Visible : System.Windows.Visibility.Hidden;
            mainWindow.MainFrame.Navigate(page.Page);
        }
        public static void BackPage()
        {
            if (storylist.Count > 1)
            {
                storylist.RemoveAt(storylist.Count - 1);
                Update(storylist[storylist.Count - 1]);
            }
        }
        public static void ClearStoryList()
        {
            //App.isAdmin = false;
            storylist.Clear();
        }
    }
    internal class PageComponent
    {
        public string Title { get; set;}
        public Page Page { get; set; }
        public PageComponent(string title, Page page)
        {
            Title = title;
            Page = page;
        }
    }
}
