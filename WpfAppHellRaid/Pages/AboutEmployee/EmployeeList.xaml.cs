using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfAppHellRaid.Components;

namespace WpfAppHellRaid.Pages.AboutEmployee
{
    /// <summary>
    /// Логика взаимодействия для EmployeeList.xaml
    /// </summary>
    public partial class EmployeeList : Page
    {
        public EmployeeList()
        {
            InitializeComponent();
            EmployeeListView.ItemsSource = App.DataBase.Employee.Where(x => x.EmplEnable == true).ToList();
        }
        private void ListRefresh()
        {
            var database = App.DataBase.Employee.Where(x => x.EmplEnable == true);
            ICollectionView view = CollectionViewSource.GetDefaultView(database.ToList());

            if (TitleSortCB.SelectedIndex == 0)
            {
                EmployeeListView.ItemsSource = database.OrderBy(x => x.Job_title.Name_jod_title).ToList();
            }
            if (TitleSortCB.SelectedIndex == 1)
            {
                EmployeeListView.ItemsSource = database.OrderByDescending(x => x.Job_title.Name_jod_title).ToList();
            }
            if (NameSortCB.SelectedIndex == 0)
            {
                EmployeeListView.ItemsSource = database.OrderBy(x => x.SFP).ToList();
            }
            if (NameSortCB.SelectedIndex == 1)
            {
                EmployeeListView.ItemsSource = database.OrderByDescending(x => x.SFP).ToList();
            }
            if (SearchTB.Text != "" & SearchTB.Text != null)
            {
                EmployeeListView.ItemsSource = database.Where(x => x.SFP.ToLower().Contains(SearchTB.Text.ToLower())).ToList();
            }

            view.Refresh();
        }
        private void TitleSortCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ListRefresh();
        }

        private void NameSortCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ListRefresh();
        }

        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            ListRefresh();
        }

        private void AddEmpl_Click(object sender, RoutedEventArgs e)
        {
            if (EmployeeListView.SelectedItem != null)
                ModernNavigation.NextPage(new PageComponent("Редактировать запись о сотруднике", new EmployeeEdit((EmployeeListView.SelectedItem as Employee))));
            else
            {
                ModernNavigation.NextPage(new PageComponent("Добавление запись о сотруднике", new EmployeeEdit(new Employee())));
                MessageBox.Show("Открыто окно добавления записи.\n Что бы изменить запись вернитесь и выберите запись из списка.");
            }
        }

        private void DelEmpl_Click(object sender, RoutedEventArgs e)
        {
            if (EmployeeListView.SelectedItem != null)
            {
                (EmployeeListView.SelectedItem as Employee).EmplEnable = false;
                MessageBox.Show($"Запись {(EmployeeListView.SelectedItem as Employee).ID} была удалена");
                App.DataBase.SaveChanges();
            }
            else
                MessageBox.Show("Выберите запись");
        }

        private void RefreshList_Click(object sender, RoutedEventArgs e)
        {
            EmployeeListView.ItemsSource = App.DataBase.Exasm.Where(x => x.ExamEnable == true).ToList();
            TitleSortCB.SelectedIndex = 0;
            NameSortCB.SelectedIndex = 0;
        }

    }
}
