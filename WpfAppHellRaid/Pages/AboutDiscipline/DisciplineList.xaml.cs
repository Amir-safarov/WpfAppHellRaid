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

namespace WpfAppHellRaid.Pages.AboutDiscipline
{
    /// <summary>
    /// Логика взаимодействия для DisciplineList.xaml
    /// </summary>
    public partial class DisciplineList : Page
    {
        public DisciplineList()
        {
            InitializeComponent();
            ListRefresh();
            DisciplineListView.ItemsSource = App.DataBase.Discipline.ToList();
            if(App.isAdmin == false)
            {
                EditDisc.Visibility = Visibility.Collapsed;
                RemDisc.Visibility = Visibility.Collapsed;
            }
        }
        private void ListRefresh()
        {
            var database = App.DataBase.Discipline.Where(x => x.DiscEnable == true);
            ICollectionView view = CollectionViewSource.GetDefaultView(database.ToList());
            if (DepSortCB.SelectedIndex == 0)
                return;
            if (DepSortCB.SelectedIndex == 1)
            {
                DisciplineListView.ItemsSource = database.OrderBy(x => x.Department.Dep_Name).ToList();
            }
            if (DepSortCB.SelectedIndex == 2)
            {
                DisciplineListView.ItemsSource = database.OrderByDescending(x => x.Department.Dep_Name).ToList();
            }
            if (VolSortCB.SelectedIndex == 0)
                return;
            if (VolSortCB.SelectedIndex == 1)
            {
                DisciplineListView.ItemsSource = database.OrderBy(x => x.Volume).ToList();
            }
            if (VolSortCB.SelectedIndex == 2)
            {
                DisciplineListView.ItemsSource = database.OrderByDescending(x => x.Volume).ToList();
            }
            if (SearchTB.Text != "" & SearchTB.Text != null)
            {
                DisciplineListView.ItemsSource = database.Where(x => x.DiscName.ToLower().Contains(SearchTB.Text.ToLower())).ToList();
            }

            view.Refresh();
        }

        private void EditDisc_Click(object sender, RoutedEventArgs e)
        {
            if(DisciplineListView.SelectedItem != null)
                ModernNavigation.NextPage(new PageComponent("Редактировать запись дисциплины", new DisciplaneEdit((DisciplineListView.SelectedItem as Discipline))));
            else
            {
                ModernNavigation.NextPage(new PageComponent("Добавление запись дисциплины", new DisciplaneEdit(new Discipline())));
                MessageBox.Show("Открыто окно добавления записи.\n Что бы изменить запись вернитесь и выберите запись из списка.");
            }
        }

        private void NameSortCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ListRefresh();

        }

        private void SpecSortCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ListRefresh();

        }

        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            ListRefresh();
        }

        private void RemDisc_Click(object sender, RoutedEventArgs e)
        {
            if (DisciplineListView.SelectedItem != null)
            {
                (DisciplineListView.SelectedItem as Discipline).DiscEnable = false;
                MessageBox.Show($"Запись {(DisciplineListView.SelectedItem as Discipline).ID} была удалена");
                App.DataBase.SaveChanges();
            }
            else
                MessageBox.Show("Выберите запись");
        }

        private void RefreshList_Click(object sender, RoutedEventArgs e)
        {
            DisciplineListView.ItemsSource = App.DataBase.Discipline.ToList();
            DepSortCB.SelectedIndex = 0;
            VolSortCB.SelectedIndex = 0;
        }
    }
}
