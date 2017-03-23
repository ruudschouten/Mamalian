using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianLib;

namespace Tester {
    class Program {
        static void Main(string[] args) {
            Stats playerStats = new Stats(1, 1, 50, 20, 2, 2, 10, 5, 20);
            Class playerClass = new Class(1, "Warrior", 15, 20);
            Player player = new Player(1, "Yes", playerStats, playerClass, Gender.Male, Race.Pidgeon);

            Enemy enemy = new Enemy(1, "very bad enemy", playerStats, Gender.Male, Race.Cat, 15, 5, 5, 12);

            Armour armour = new Armour(1, "Wooden armour", "Shoddy armour with a lot of splinters", 50, 5, 12);
            Weapon weapon = new Weapon(1, "Shovel", "A pretty normal shovel", 15, 1.25f, 10, 0);
            Stats potionStats = new Stats(50, 0, 0, 0, 0, 0, 0);
            Potion potion = new Potion(1, "Healing potion", "Heals a man", 50, potionStats);

            PowerUp powerUp = new PowerUp(1, "Healing", "Heals the character over time", new Stats(0, 0, 50, 0, 0, 0, 0));

            Wave wave = new Wave(1, 1.5f, 20, new List<Enemy>{enemy}, new List<PowerUp>{powerUp});

            Console.WriteLine("Player\n" + player);
            Console.ReadLine();
            Console.WriteLine("Enemy\n" + enemy);
            Console.ReadLine();
            Console.WriteLine("Armour\n" + armour);
            Console.ReadLine();
            Console.WriteLine("Weapon\n" + weapon);
            Console.ReadLine();
            Console.WriteLine("Potion\n" + potion);
            Console.ReadLine();
            Console.WriteLine("PowerUp\n" + powerUp);
            Console.ReadLine();
            Console.WriteLine("Wave\n" + wave);
            Console.ReadLine();
        }
    }
}