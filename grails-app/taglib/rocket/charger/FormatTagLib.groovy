package rocket.charger

class FormatTagLib {

    static namespace = "format"
    static returnObjectForTags = ["monetarySymbol"]

    def monetarySymbol = { attrs ->
       out << "R\$ " + attrs.number
    }
}