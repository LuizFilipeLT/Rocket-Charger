package rocket.charger

class FormatTagLib {

    static namespace = "format"
    static returnObjectForTags = ["monetarySymbol"]

    def monetarySymbol = { attrs ->
    println(attrs.number)
       out << "R\$ " + attrs.number
    }
}