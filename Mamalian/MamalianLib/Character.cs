using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public enum Gender {
        Male,
        Female
    }

    public enum Race {
        Cat,
        Dog,
        Fish,
        Pidgeon
    }

    public abstract class Character {
        public int Id { get; set; }
        public String Name { get; set; }
        public Gender Gender { get; set; }
        public Race Race { get; set; }
        public Stats Stats { get; set; }
    }
}
