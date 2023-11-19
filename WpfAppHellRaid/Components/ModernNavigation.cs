using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Model;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using WpfAppHellRaid.Pages;

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
            mainWindow.TitleTb.Text = page.Title;
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
        public static void BackAuth()
        {
            App.isAdmin = false;
            App.isEmployee = false;
            ClearStoryList();
            NextPage(new PageComponent("Меню", new Authorization()));
        }
    }
    internal class PageComponent
    {
        private string v;
        private Menu menu;

        public string Title { get; set;}
        public Page Page { get; set; }
        public PageComponent(string title, Page page)
        {
            Title = title;
            Page = page;
        }

        public PageComponent(string v, Menu menu)
        {
            this.v = v;
            this.menu = menu;
        }
    }
}
