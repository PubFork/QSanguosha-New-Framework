import QtQuick 2.4
import QtQuick.Layouts 1.1
import Cardirector.Device 1.0
import Cardirector.Resource 1.0

RowLayout {
    property alias headGeneralName: headGeneralItem.generalName
    property alias headGeneralAvatar: headGeneralItem.avatar
    property alias headGeneralKingdom: headGeneralItem.kingdom
    property alias deputyGeneralName: deputyGeneralItem.generalName
    property alias deputyGeneralAvatar: deputyGeneralItem.avatar
    property alias deputyGeneralKingdom: deputyGeneralItem.kingdom
    property int seatNumber: 0
    property alias handcardNum : handcardNumItem.value
    property string playerRole: "unknown"

    spacing: 0
    Layout.fillHeight: false
    Layout.preferredHeight: Device.gu(150)

    ImageProvider {
        id: roomSceneImage
        providerId: "dashboard"

        function imagePath(imageId, requestedSize)
        {
            return "image/roomscene/dashboard/" + imageId + ".png";
        }
    }

    Image {
        source: "image://dashboard/equip"
        Layout.preferredWidth: Device.gu(164)
        Layout.fillHeight: true
    }

    Image {
        source: "image://dashboard/hand"
        Layout.fillWidth: true
        Layout.fillHeight: true

        RowLayout {
            anchors.fill: parent

            Item {
                id: handcardArea
                Layout.fillWidth: true
                Layout.fillHeight: true

                HandcardNumber {
                    id: handcardNumItem
                    kingdom: headGeneralKingdom
                    x: parent.width - width / 2
                    y: parent.height - height - Device.gu(5)
                }
            }

            Image {
                id: platter
                source: "image://dashboard/platter"

                IrregularButton {
                    name: "platter/confirm"
                    enabled: false
                    x: Device.gu(6)
                    y: Device.gu(3)
                }

                IrregularButton {
                    name: "platter/cancel"
                    enabled: false
                    x: Device.gu(6)
                    y: Device.gu(79)
                }

                IrregularButton {
                    name: "platter/discard"
                    enabled: false
                    x: Device.gu(67)
                    y: Device.gu(37)
                }

                Image {
                    source: "image://root/role/" + playerRole
                    x: Device.gu(70)
                    y: Device.gu(3)
                }

                Image {
                    x: Device.gu(71)
                    y: Device.gu(117)
                    source: seatNumber > 0 ? "image://dashboard/seatnum/" + seatNumber : ""
                    visible: seatNumber > 0
                }
            }
        }
    }

    Item {
        width: Device.gu(283)
        height: Device.gu(149)

        Image {
            source: "image://dashboard/base"
        }

        Image {
            source: "image://dashboard/hpbase"
            anchors.bottom: parent.bottom
            anchors.left: deputyGeneralItem.right
        }

        Image {
            source: "image://dashboard/avatarbg"
        }

        DashboardGeneral {
            id: headGeneralItem
            y: -Device.gu(4)
            avatar: "huangyueying"
            generalPosition: "head"
        }

        DashboardGeneral {
            id: deputyGeneralItem
            x: Device.gu(128)
            y: -Device.gu(4)
            avatar: "zhugeliang"
            generalPosition: "deputy"
        }
    }
}
